import { Injectable, signal } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class AppAuthService {
  private _accessToken: string | null = null;
  private _refreshToken: string | null = null;

  getAccessToken(): string | null {
    return !this._accessToken ? localStorage.getItem('access_token') : this._accessToken;
  }

  getRefreshToken(): string | null {
    return !this._refreshToken ? localStorage.getItem('refresh_token') : this._refreshToken;
  }

  setAccessToken(token: string) {
    this._accessToken = token;
  }

  setRefreshToken(token: string) {
    this._refreshToken =  token;
  }

  clearToken() {
    this._accessToken = null;
    this._refreshToken = null;
  }

  logout(): void {
    this.clearToken();
    localStorage.removeItem('access_token');
    localStorage.removeItem('refresh_token');
  }
} 