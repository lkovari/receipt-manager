import { Directive, ElementRef, HostListener, Input, Renderer2, AfterViewInit } from '@angular/core';


@Directive({
  selector: '[appShowTooltip]'
})
export class ShowTooltipDirective {
  @Input('appShowTooltip') tooltipText: string = '';

  constructor(private el: ElementRef, private renderer: Renderer2) {}

  ngAfterViewInit() {
    this.updateTooltip();
  }

  @HostListener('window:resize')
  onResize() {
    this.updateTooltip();
  }

  private updateTooltip() {
    const element = this.el.nativeElement;

    if (element.offsetWidth < element.scrollWidth) {
      this.renderer.setAttribute(element, 'title', this.tooltipText || element.textContent.trim());
    } else {
      this.renderer.removeAttribute(element, 'title');
    }
  }
}
