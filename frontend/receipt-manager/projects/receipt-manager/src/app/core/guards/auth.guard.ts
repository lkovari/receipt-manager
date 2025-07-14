import { CanActivateFn, Router } from '@angular/router';
import { inject } from '@angular/core';

export const authGuard: CanActivateFn = (route, state) => {
  const token = localStorage.getItem('access_token');
  if (token) {
    return true;
  } else {
    return inject(Router).createUrlTree(['/login']);
  }
}; 