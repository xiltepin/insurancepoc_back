import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PrismaService } from "../prisma/prisma.service";
import { CustomerInfoModule } from './customer-info/customer-info.module';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'localhost',
      port: 5432,
      password: 'postgres',
      username: 'postgres',
      entities: [],
      database: 'postgres',
      synchronize: true,
      logging: true,
    }),
    CustomerInfoModule,
    PrismaModule,
  ],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule {}
