import { Routes } from '@angular/router';
import { authGuard } from './core/guards/auth.guard';
import { ReceiptListResolver } from './core/resolves/receipt-list.resolve';
import { ReceiptDetailsResolver } from './core/resolves/receipt-details.resolve';

export const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: 'splash-screen'
  },
  {
    path: 'splash-screen',
    loadComponent: () => import('./shared/components/splash-screen/splash-screen').then(m => m.SplashScreenComponent)
  },
  {
    path: 'login',
    loadComponent: () => import('./shared/components/login/login').then(m => m.Login)
  },
  {
    path: 'home',
    loadComponent: () => import('./features/home/home').then(m => m.Home),
    canActivate: [authGuard]
  },
  {
    path: 'receipt-list',
    loadComponent: () => import('./features/receipt-list/receipt-list').then(m => m.ReceiptListComponent),
    canActivate: [authGuard],
    resolve: { receipts: ReceiptListResolver }
  },
  {
    path: 'receipt-details/:id',
    loadComponent: () => import('./features/receipt-details/receipt-details').then(m => m.ReceiptDetailsComponent),
    canActivate: [authGuard],
    resolve: { receiptDetail: ReceiptDetailsResolver }
  },
  {
    path: 'add-receipt',
    loadComponent: () => import('./features/add-receipt/add-receipt').then(m => m.AddReceiptComponent),
    canActivate: [authGuard]
  },
  { 
    path: 'logout',
    loadComponent: () => import('./shared/components/logout/logout').then(m => m.LogoutComponent)
  },
];
