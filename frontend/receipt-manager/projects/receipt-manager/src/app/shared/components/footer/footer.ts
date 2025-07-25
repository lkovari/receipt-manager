import { Component, OnInit, OnDestroy, ChangeDetectorRef } from '@angular/core';
import { AngularVersion } from '../../../../../../common-lib/src/lib/angular-version/angular-version';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.html',
  imports: [AngularVersion],
  styleUrl: './footer.scss'
})
export class Footer implements OnInit, OnDestroy {
  developers = [' Front-End by László Kővári ', ' Back-End by Norbert Rafai '];

  developerOrders = [[1, 2], [2, 1]];

  private previousIndex: number | null = null;
  currentDeveloperOrder = '';
  private intervalId: any;

  constructor(private cdr: ChangeDetectorRef) { }

  ngOnInit(): void {
    this.currentDeveloperOrder = this.getDeveloperOrder();
    this.intervalId = setInterval(() => {
      this.currentDeveloperOrder = this.getDeveloperOrder();
      this.cdr.detectChanges();
    }, 9000);
  }

  ngOnDestroy(): void {
    if (this.intervalId) {
      clearInterval(this.intervalId);
    }
  }

  getDeveloperOrder(): string {
    let idx: number;
    do {
      idx = Math.floor(Math.random() * 2);
    } while (idx === this.previousIndex);
    this.previousIndex = idx;
    const order = this.developerOrders[idx];
    return order.map(i => this.developers[i - 1]).join(', ');
  }

  onAnimationEnd(): void {
    // TODO
  }
}
