import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserModule } from './user/user.module';
import { PrismaService } from "../prisma/prisma.service";
import { User } from "./user/entities/user.entity";
import { CustomerInfoModule } from './customer-info/customer-info.module';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'localhost',
      port: 5432,
      password: 'admin',
      username: 'admin',
      entities: [],
      database: 'postgres',
      synchronize: true,
      logging: true,
    }),
    UserModule,
    CustomerInfoModule,
    PrismaModule,
  ],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule {}
