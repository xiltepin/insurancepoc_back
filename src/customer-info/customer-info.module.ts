import { Module } from '@nestjs/common';
import { CustomerInfoService } from './customer-info.service';
import { CustomerInfoController } from './customer-info.controller';
import { PrismaModule } from '../prisma/prisma.module';

@Module({
  imports: [PrismaModule],
  providers: [CustomerInfoService],
  controllers: [CustomerInfoController],
})
export class CustomerInfoModule {}
