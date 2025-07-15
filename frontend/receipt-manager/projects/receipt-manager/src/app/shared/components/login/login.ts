import { ChangeDetectionStrategy, Component, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, Validators } from '@angular/forms';
import { AuthService } from '../../../core/api/auth.service';
import { LoginRequest } from '../../../core/model/loginRequest';
import { Router } from '@angular/router';
import { LoginResponse } from '../../../core/model/loginResponse';

@Component({
  selector: 'app-login',
  imports: [CommonModule, ReactiveFormsModule],
  providers: [FormBuilder],
  templateUrl: './login.html',
  styleUrl: './login.scss',
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class Login {
  private fb = inject(FormBuilder);
  private authService = inject(AuthService);
  private router = inject(Router);

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
        const loginResponse = response as LoginResponse;
        localStorage.setItem('access_token', loginResponse.access_token);
        localStorage.setItem('refresh_token', loginResponse.refresh_token);
        console.log('Type ', typeof loginResponse.access_token, loginResponse.access_token);
        console.log('Login success', loginResponse);
        this.router.navigateByUrl('/home');
      },
      error: (err) => {
        localStorage.removeItem('access_token');
        localStorage.removeItem('refresh_token');
        this.router.navigateByUrl('/login');
        console.error('Login error', err);
      },
    });
  }
}
