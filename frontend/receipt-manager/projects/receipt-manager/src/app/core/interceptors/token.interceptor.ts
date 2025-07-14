import {
  HttpHandlerFn,
  HttpInterceptorFn,
  HttpRequest,
} from '@angular/common/http';
import { inject } from '@angular/core';
import { catchError, switchMap, throwError, of } from 'rxjs';
import { AppAuthService } from '../services/app-auth.service';
import { AuthService } from '../api/auth.service';
import { RefreshRequest } from '../model/refreshRequest';
import { Router } from '@angular/router';

export const tokenInterceptor: HttpInterceptorFn = (
  request: HttpRequest<unknown>,
  next: HttpHandlerFn,
) => {
  const appAuth = inject(AppAuthService);
  const authService = inject(AuthService);
  const router = inject(Router);
  const accessToken = appAuth.getAccessToken();

  if (accessToken) {
    request = addToken(request, accessToken);
  }

  return next(request).pipe(
    catchError((error) => {
      if (error.status === 401 || error.status === 403) {
        
        let refreshToken: string;
        if (appAuth.getRefreshToken() !== null) {
          refreshToken = appAuth.getRefreshToken()!.slice();
        } else {
          appAuth.clearToken();
          router.navigate(['/login']);
          return throwError(() => new Error('No refresh token available'));
        }
        
        const refreshRequest: RefreshRequest = { refresh_token: refreshToken };
        appAuth.clearToken();
        return authService.refreshTokenEndpointAuthRefreshPost(refreshRequest).pipe(
          switchMap((response: any) => {
            appAuth.setAccessToken(response.access_token);
            appAuth.setRefreshToken(response.refresh_token);
            localStorage.setItem('access_token', response.access_token);
            localStorage.setItem('refresh_token', response.refresh_token);
            const newRequest = addToken(request, response.access_token);
            return next(newRequest);
          }),
          catchError((refreshError) => {
            appAuth.clearToken();
            router.navigate(['/login']);
            return throwError(() => refreshError instanceof Error ? refreshError : new Error(refreshError));
          })
        );
      }
      return throwError(() => error instanceof Error ? error : new Error(error));
    }),
  );
};

const addToken = (request: HttpRequest<any>, token: string) => {
  return request.clone({
    setHeaders: {
      Authorization: `Bearer ${token}`,
    },
  });
};
