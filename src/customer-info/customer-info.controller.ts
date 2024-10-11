import { Controller, Get, Post, Body } from '@nestjs/common'; // Asegúrate de que 'Post' está importado
import { CustomerInfoService } from './customer-info.service';
import { CreateCustomerInfoDto } from './dto/create-customer-info.dto';

@Controller('CustomersInfo')
export class CustomerInfoController {
  constructor(private readonly customerInfoService: CustomerInfoService) {}

  @Get()
  async getAllCustomersInfo() {
    return this.customerInfoService.getAllCustomersInfo();
  }

  @Post() // El decorador Post debe estar aquí
  async createCustomerInfo(@Body() createCustomerInfoDto: CreateCustomerInfoDto) {
    return this.customerInfoService.createCustomerInfo(createCustomerInfoDto);
  }
}
