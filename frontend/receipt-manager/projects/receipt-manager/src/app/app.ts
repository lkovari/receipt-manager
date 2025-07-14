import { Component } from '@angular/core';
import { MainLayout } from './shared/components/main-layout/main-layout';

@Component({
  selector: 'app-root',
  imports: [MainLayout],
  templateUrl: './app.html',
  styleUrl: './app.scss'
})
export class App {
  protected title = 'receipt-manager';
}
