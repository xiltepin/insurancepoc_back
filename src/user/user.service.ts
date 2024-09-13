/* eslint-disable */
import { Injectable, Logger } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaService } from '../../prisma/prisma.service';
import { User } from '@prisma/client';

@Injectable()
export class UserService {
  private readonly logger = new Logger(UserService.name);
  constructor(private prisma: PrismaService) {}
  private _createUserDto: CreateUserDto;

  create(createUserDto: CreateUserDto) {
    this._createUserDto = createUserDto;
    return 'This action adds a new user';
  }

  async findAll(): Promise<User[]> {
    const message = 'findAll function invoked from:user.service.ts';
    this.logger.log(`Message: ${message}`);
    return this.prisma.user.findMany();
  }

  findOne(id: number) : Promise<User | null> {
    const message = 'findOne function invoked from:user.service.ts';
    this.logger.log(`Message: ${message}`);
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
