/* eslint-disable */
import { Injectable, Logger } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaService } from '../../prisma/prisma.service';
import { User } from '@prisma/client';
import { Prisma } from '@prisma/client';

@Injectable()
export class UserService {
  private readonly logger = new Logger(UserService.name);
  constructor(private prisma: PrismaService) {}

  async createUser(data: Prisma.UserCreateInput) {
    return this.prisma.user.create({
      data,
    });
  }

  async findAll(): Promise<User[]> {
    this.logger.log('findAll function invoked from:user.service.ts');
    return this.prisma.user.findMany();
  }

  findOne(id: number) : Promise<User | null> {
    this.logger.log('findOne function invoked from:user.service.ts');
    return this.prisma.user.findUnique({
      where: { id },
    });
  }

  async getUserById(id: number): Promise<User | null> {
    return this.prisma.user.findUnique({
      where: { id },
    });
  }

  // update(id: number, updateUserDto: UpdateUserDto) {
  //   return `This action updates a #${id} user`;
  // }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
