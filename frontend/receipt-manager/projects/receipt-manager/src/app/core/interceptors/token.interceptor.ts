import {
  HttpHandlerFn,
  HttpInterceptorFn,
  HttpRequest,
} from '@angular/common/http';
import { inject } from '@angular/core';
import { catchError, switchMap, throwError, of } from 'rxjs';
import { AuthService } from '../api/auth.service';
import { RefreshRequest } from '../model/refreshRequest';
import { Router } from '@angular/router';
import { LoginResponse } from '../model/loginResponse';

export const tokenInterceptor: HttpInterceptorFn = (
  request: HttpRequest<unknown>,
  next: HttpHandlerFn,
) => {
  const authService = inject(AuthService);
  const router = inject(Router);
  const accessToken = localStorage.getItem('access_token');

  if (accessToken) {
    console.log('Interceptor token:', accessToken);
    request = addToken(request, accessToken);
  } else {
    console.log('Interceptor: NO TOKEN');
  }

  return next(request).pipe(
    catchError((error) => {
      if (error.status === 401 || error.status === 403) {

        let refreshToken: string | null;
        if (localStorage.getItem('refresh_token') !== null) {
          refreshToken = localStorage.getItem('refresh_token')
        } else {
          router.navigate(['/login']);
          return throwError(() => new Error('No refresh token available'));
        }

        const refreshRequest: RefreshRequest = { refresh_token: refreshToken! };
        localStorage.removeItem('access_token');
        localStorage.removeItem('refresh_token');
        return authService.refreshTokenEndpointAuthRefreshPost(refreshRequest).pipe(
          switchMap((response: any) => {
            const loginResponse = response as LoginResponse;
            localStorage.setItem('access_token', loginResponse.access_token);
            localStorage.setItem('refresh_token', loginResponse.refresh_token);
            console.log('Get Refresh token success', loginResponse);
            const newRequest = addToken(request, loginResponse.access_token);
            return next(newRequest);
          }),
          catchError((refreshError) => {
            localStorage.removeItem('access_token');
            localStorage.removeItem('refresh_token');
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
