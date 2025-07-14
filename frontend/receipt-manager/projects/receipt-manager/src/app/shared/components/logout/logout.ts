import { Component, OnInit } from '@angular/core';
import { AppAuthService } from '../../../core/services/app-auth.service';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-logout',
  imports: [CommonModule],
  providers: [AppAuthService],
  template: ''
})
export class LogoutComponent implements OnInit {
  
  constructor(private auth: AppAuthService, private router: Router) {}

  ngOnInit() {
    this.auth.logout();
    this.router.navigate(['/login']);
  }
}