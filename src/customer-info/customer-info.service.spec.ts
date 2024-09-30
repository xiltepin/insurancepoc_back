import { Test, TestingModule } from '@nestjs/testing';
import { CustomerInfoService } from './customer-info.service';

describe('CustomerInfoService', () => {
  let service: CustomerInfoService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [CustomerInfoService],
    }).compile();

    service = module.get<CustomerInfoService>(CustomerInfoService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
