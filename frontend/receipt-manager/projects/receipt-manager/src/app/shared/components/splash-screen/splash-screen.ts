import { Component, OnInit, OnDestroy, ChangeDetectorRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';

interface DeveloperLabel {
  name: string;
  color: string;
}

const DEVELOPER_NAMES = [
  'Front-End: László Kővári',
  'Back-End: Norbert Rafai'
];

@Component({
  selector: 'app-splash-screen',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './splash-screen.html',
  styleUrls: ['./splash-screen.scss']
})
export class SplashScreenComponent implements OnInit, OnDestroy {
  private static readonly SPLASH_END_DELAY_MS = 7000;

  developers = [...DEVELOPER_NAMES];

  displayedDevelopers: DeveloperLabel[] = [];
  remainingDevelopers: string[] = [];
  currentIncomingDeveloper: DeveloperLabel | null = null;
  showSplash = true;
  showAllDevelopers = false;
  animating = false;
  private animationTimeout: any;
  private finishTimeout: any;

  private colors = [
    '#e53935', '#8e24aa', '#3949ab', '#00897b', '#fbc02d', '#fb8c00',
    '#43a047', '#1e88e5', '#d81b60', '#6d4c41', '#00acc1', '#c62828',
    '#f4511e', '#3949ab', '#00bcd4'
  ];

  private developerColorPairs: DeveloperLabel[] = [];

  constructor(private router: Router, private cdr: ChangeDetectorRef) { }

  ngOnInit() {
    this.shuffleArray(this.developers); // Véletlenszerű sorrend
    this.prepareDeveloperColorPairs();
    this.displayedDevelopers = [];
    this.showAllDevelopers = false;
    this.animating = false;
    console.log('Splash screen initialized, Splash started to show developer names.');
    this.animateNextDeveloper();
  }

  ngOnDestroy() {
    if (this.animationTimeout) clearTimeout(this.animationTimeout);
    if (this.finishTimeout) clearTimeout(this.finishTimeout);
  }

  private prepareDeveloperColorPairs() {
    const devs = [...this.developers];
    const colors = [...this.colors];
    this.shuffleArray(colors);
    // Csak annyi színt használjunk, ahány fejlesztő van, és ne legyen ismétlődés
    const selectedColors = colors.slice(0, devs.length);
    this.developerColorPairs = devs.map((name, i) => ({ name, color: selectedColors[i] }));
    this.remainingDevelopers = this.developerColorPairs.map(pair => pair.name);
  }

  private animateNextDeveloper() {
    if (this.remainingDevelopers.length === 0) {
      this.currentIncomingDeveloper = null;
      this.showAllDevelopers = true;
      this.finishTimeout = setTimeout(() => {
        this.showSplash = false;
        console.log('Splash screen finished, navigating to login.');
        this.router.navigate(['/login']);
      }, SplashScreenComponent.SPLASH_END_DELAY_MS);
      console.log('All developers displayed on Splash');
      return;
    }
    const idx = Math.floor(Math.random() * this.remainingDevelopers.length);
    const name = this.remainingDevelopers[idx];
    const color = this.developerColorPairs.find(pair => pair.name === name)!.color;
    this.currentIncomingDeveloper = { name, color };
    this.animating = true;
    this.cdr.detectChanges();
    this.animationTimeout = setTimeout(() => {
      this.displayedDevelopers.push({ name, color });
      this.remainingDevelopers.splice(idx, 1);
      this.currentIncomingDeveloper = null;
      this.animating = false;
      this.cdr.detectChanges();
      setTimeout(() => this.animateNextDeveloper(), 1000);
    }, 1500);
  }

  private shuffleArray<T>(array: T[]) {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
  }
} 