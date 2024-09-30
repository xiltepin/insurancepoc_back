import { Test, TestingModule } from '@nestjs/testing';
import { CustomerInfoController } from './customer-info.controller';

describe('CustomerInfoController', () => {
  let controller: CustomerInfoController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [CustomerInfoController],
    }).compile();

    controller = module.get<CustomerInfoController>(CustomerInfoController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
