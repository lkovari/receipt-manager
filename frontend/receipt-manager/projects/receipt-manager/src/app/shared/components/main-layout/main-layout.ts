import { CommonModule } from '@angular/common';
import { Component, OnInit, signal, OnDestroy } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { LeftSideBar } from '../left-side-bar/left-side-bar';
import { Header } from '../header/header';
import { Footer } from '../footer/footer';
import { MenuItem } from '../../models/menu/menu-item';

@Component({
  selector: 'app-main-layout',
  imports: [
    CommonModule,
    RouterOutlet,
    LeftSideBar,
    Header,
    Footer,    
  ],
  templateUrl: './main-layout.html',
  styleUrl: './main-layout.scss'
})
export class MainLayout implements OnInit, OnDestroy {
  sidebarVisible: boolean = true;
  private _isMobileView = signal(false);
  private resizeListener!: () => void;

  menuItems: MenuItem[] = [
    {
      label: 'Home',
      icon: 'pi pi-home',
      routerLink: '/home',
    },
    {
      label: 'Receipts',
      icon: 'pi pi-table',
      routerLink: '/receipt-list',
    },
    {
      label: 'Upload Reciept',
      icon: 'pi pi-receipt',
      routerLink: '/add-receipt',
    },
    {
      label: 'Logout',
      icon: 'pi pi-sign-out',
      routerLink: '/logout',
    },
  ];

  ngOnInit(): void {
    this._isMobileView.set(window.innerWidth <= 768);
    if (this._isMobileView()) {
      this.sidebarVisible = false;
    } else {
      this.sidebarVisible = true;
    }
    
    this.resizeListener = () => {
      this._isMobileView.set(window.innerWidth <= 768);
      if (this._isMobileView()) {
        this.sidebarVisible = false;
      } else {
        this.sidebarVisible = true;
      }
    };
    window.addEventListener('resize', this.resizeListener);
  }

  ngOnDestroy(): void {
    if (this.resizeListener) {
      window.removeEventListener('resize', this.resizeListener);
    }
  }

  toggleSidebar(): void {
    this.sidebarVisible = !this.sidebarVisible;
  }

  openNav() {
    const navi = document.getElementById("navi");
    if (navi) {
      navi.style.width = "100%";
    }
  }

  closeNav() {
    if (window.innerWidth <= 768) {
      this.sidebarVisible = false;
    }
  }

  isMobileView(): boolean {
    return this._isMobileView();
  }
}
