import { Controller, Get, Post, Body, Patch, Param, Delete, ParseIntPipe } from '@nestjs/common';
import { UserService } from './user.service';
import { Prisma, User  } from '@prisma/client';
import { Logger } from '@nestjs/common';


@Controller('users')
export class UserController {
  private readonly logger = new Logger(UserController.name);
  constructor(private readonly userService: UserService) {}

  @Post()
  async createUser(@Body() userData: Prisma.UserCreateInput) {
    this.logger.log('createUser function invoked from:user.controller.ts');
    return this.userService.createUser(userData);
  }

  @Get()
  async getAllUsers() {
    return this.userService.getAllUsers();
  }

  @Get(':id')
  async getUserById(@Param('id', ParseIntPipe) id: number): Promise<User | null> {
    return this.userService.getUserById(id);
  }


  @Patch(':id')
  async updateUser(@Param('id') id: string, @Body() userData: Prisma.UserUpdateInput) {
    this.logger.log('patchUser function invoked from:user.controller.ts');
    return this.userService.updateUser(Number(id), userData);
  }

  @Delete(':id')
  async deleteUser(@Param('id', ParseIntPipe) id: number): Promise<User> {
    return this.userService.deleteUser(id);
  }

}
