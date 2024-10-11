const { PrismaClient } = require('@prisma/client');
const { faker } = require('@faker-js/faker');

const prisma = new PrismaClient();

async function main() {
  for (let i = 0; i < 100; i++) {
    await prisma.customerInfo.create({
      data: {
        first_name: faker.name.firstName().substring(0, 50),
        last_name: faker.name.lastName().substring(0, 50),
        date_of_birth: faker.date.past(50, new Date('2000-01-01')),
        address: faker.address.streetAddress().substring(0, 255),
        phone_number: faker.phone.number('###-###-####').substring(0, 15),
        email: faker.internet.email().substring(0, 100),
      },
    });
  }
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
