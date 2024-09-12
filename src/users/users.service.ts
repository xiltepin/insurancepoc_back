// src/users/users.service.ts
import { Injectable, Logger } from '@nestjs/common';
import { PrismaService } from 'prisma/prisma.service';
import { User } from '@prisma/client';

@Injectable()
export class UsersService {
  private readonly logger = new Logger(UsersService.name);
  constructor(private prisma: PrismaService) {}

  async findAll(): Promise<User[]> {
    const message = 'findAll function invoked from:users.service.ts';
    this.logger.log(`Message: ${message}`);
    return this.prisma.user.findMany();
  }
}
