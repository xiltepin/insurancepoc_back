import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { CreateCustomerInfoDto } from './dto/create-customer-info.dto';

@Injectable()
export class CustomerInfoService {
  constructor(private prisma: PrismaService) {}

  async getAllCustomersInfo() {
    return this.prisma.customerInfo.findMany();
  }

  async createCustomerInfo(customerData: Prisma.CustomerInfoCreateInput) {
    return this.prisma.customerInfo.create({
      data: {
        first_name: customerData.first_name,
        last_name: customerData.last_name,
        date_of_birth: customerData.date_of_birth,
        address: customerData.address,
        phone_number: customerData.phone_number,
        email: customerData.email,
      },
    });
  }

}
