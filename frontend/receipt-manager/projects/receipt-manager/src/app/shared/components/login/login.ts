import { ChangeDetectionStrategy, Component, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, Validators } from '@angular/forms';
import { AuthService } from '../../../core/api/auth.service';
import { LoginRequest } from '../../../core/model/loginRequest';
import { Router } from '@angular/router';
import { AppAuthService } from '../../../core/services/app-auth.service';

@Component({
  selector: 'app-login',
  imports: [CommonModule, ReactiveFormsModule],
  providers: [AuthService, FormBuilder],
  templateUrl: './login.html',
  styleUrl: './login.scss',
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class Login {
  private fb = inject(FormBuilder);
  private authService = inject(AuthService);
  private router = inject(Router);
  private appAuth = inject(AppAuthService);

  email = signal('');
  password = signal('');

  form = this.fb.group({
    email: [this.email(), [Validators.required, Validators.email]],
    password: [this.password(), [Validators.required]],
  });

  get emailControl() {
    return this.form.get('email');
  }
  get passwordControl() {
    return this.form.get('password');
  }

  onEmailInput(event: Event) {
    const value = (event.target as HTMLInputElement).value;
    this.email.set(value);
    this.emailControl?.setValue(value);
    this.emailControl?.markAsDirty();
  }

  onPasswordInput(event: Event) {
    const value = (event.target as HTMLInputElement).value;
    this.password.set(value);
    this.passwordControl?.setValue(value);
    this.passwordControl?.markAsDirty();
  }

  onSubmit() {
    if (this.form.invalid) return;
    const loginRequest: LoginRequest = {
      email: this.email(),
      password: this.password(),
    };
    this.authService.loginAuthLoginPost(loginRequest).subscribe({
      next: (response) => {
        localStorage.setItem('access_token', response.access_token);
        localStorage.setItem('refresh_token', response.refresh_token);
        this.appAuth.setAccessToken(response.access_token);
        this.appAuth.setRefreshToken(response.refresh_token);
        console.log('Login success', response);
        this.router.navigateByUrl('/home');
      },
      error: (err) => {
        this.appAuth.clearToken();
        this.router.navigateByUrl('/login');
        console.error('Login error', err);
      },
    });
  }
}
