import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class CustomerInfoService {
  constructor(private prisma: PrismaService) {}

  async getAllCustomersInfo() {
    return this.prisma.customerInfo.findMany();
  }
}
