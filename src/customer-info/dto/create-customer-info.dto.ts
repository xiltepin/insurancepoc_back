import { IsString, IsOptional, IsEmail, IsDateString } from 'class-validator';

export class CreateCustomerInfoDto {

    @IsOptional()
    @IsString()
    first_name: string;

    @IsOptional()
    @IsString()
    last_name: string;

    @IsDateString()
    date_of_birth: string;

    @IsOptional()
    @IsString()
    address?: string;

    @IsOptional()
    @IsString()
    phone_number?: string;

    @IsOptional()
    @IsEmail()
    email?: string;
}
