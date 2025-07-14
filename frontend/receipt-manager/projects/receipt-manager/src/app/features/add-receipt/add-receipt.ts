import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ReceiptsService } from '../../core/api/receipts.service';

@Component({
  selector: 'app-add-receipt',
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './add-receipt.html',
  styleUrl: './add-receipt.scss'
})
export class AddReceiptComponent {
  form: FormGroup;
  selectedFile: File | null = null;
  uploadError: string | null = null;
  uploadSuccess: boolean = false;
  uploading: boolean = false;

  constructor(private fb: FormBuilder, private receiptsService: ReceiptsService) {
    this.form = this.fb.group({
      file: [null, Validators.required]
    });
  }

  onFileChange(event: Event) {
    this.uploadSuccess = false;
    const input = event.target as HTMLInputElement;
    if (input.files && input.files.length > 0) {
      const file = input.files[0];
      if (file.type.startsWith('image/')) {
        this.selectedFile = file;
        this.form.patchValue({ file });
        this.uploadError = null;
      } else {
        this.selectedFile = null;
        this.form.patchValue({ file: null });
        this.uploadError = 'Only image files are allowed.';
      }
    } else {
      this.selectedFile = null;
      this.form.patchValue({ file: null });
    }
  }

  onSubmit() {
    if (!this.form.valid || !this.selectedFile) {
      this.uploadError = 'Please select an image file.';
      return;
    }
    this.uploading = true;
    this.uploadError = null;
    this.uploadSuccess = false;
    const blob = this.selectedFile as Blob;
    this.receiptsService.processReceiptImageReceiptsProcessPost(blob).subscribe({
      next: () => {
        this.uploadSuccess = true;
        this.uploading = false;
        this.form.reset();
        this.selectedFile = null;
      },
      error: (err) => {
        this.uploadError = 'Upload failed. Please try again.';
        this.uploading = false;
      }
    });
  }
}
