import { Controller, Get } from '@nestjs/common';
import { CustomerInfoService } from './customer-info.service';

@Controller('CustomersInfo')
export class CustomerInfoController {
  constructor(private readonly customerInfoService: CustomerInfoService) {}

  @Get()
  async getAllCustomersInfo() {
    return this.customerInfoService.getAllCustomersInfo();
  }
}
