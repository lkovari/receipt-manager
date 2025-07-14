export * from './auth.service';
import { AuthService } from './auth.service';
export * from './default.service';
import { DefaultService } from './default.service';
export * from './receipts.service';
import { ReceiptsService } from './receipts.service';
export * from './tasks.service';
import { TasksService } from './tasks.service';
export const APIS = [AuthService, DefaultService, ReceiptsService, TasksService];
