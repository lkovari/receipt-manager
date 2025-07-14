import { Component, OnInit } from '@angular/core';
import * as angular from '@angular/forms';

@Component({
  selector: 'lib-angular-version',
  imports: [],
  templateUrl: './angular-version.html',
  styleUrl: './angular-version.css'
})
export class AngularVersion implements OnInit {
  angularVersion!: string;
  ngOnInit(): void {
    this.angularVersion = angular.VERSION.full;
  }
}
