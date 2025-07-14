import { CommonModule } from '@angular/common';
import { Component, output } from '@angular/core';

@Component({
  selector: 'app-header',
  imports: [CommonModule],
  templateUrl: './header.html',
  styleUrl: './header.scss'
})
export class Header {
  lastUpdateDate = new Date('07/05/2025 07:55 PM');
  onSidebarVisibleChange = output<void>();

  toggleSidebar(): void {
    this.onSidebarVisibleChange.emit();
  }
}
