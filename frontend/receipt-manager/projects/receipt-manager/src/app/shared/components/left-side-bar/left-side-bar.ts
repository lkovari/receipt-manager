import { Component, input, output } from '@angular/core';
import { MenuItem } from '../../models/menu/menu-item';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-left-side-bar',
  imports: [RouterLink],
  templateUrl: './left-side-bar.html',
  styleUrl: './left-side-bar.scss'
})
export class LeftSideBar {
  menuItems = input<MenuItem[]>([]);
  menuItemSelected = output<void>();
}
