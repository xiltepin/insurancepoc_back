import { PrismaClient } from '@prisma/client';
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient();

const makes = ['Nissan', 'Toyota', 'Volkswagen', 'Mercedes-Benz'];
const uniqueModels = new Set(); // Use a Set to ensure uniqueness

async function main() {
    for (let i = 0; i < 100; i++) {
        const make = makes[Math.floor(Math.random() * makes.length)];

        // Generate a unique model name using Faker
        let model;
        do {
            model = faker.vehicle.model();
        } while (uniqueModels.has(model)); // Ensure the model is unique
        uniqueModels.add(model);

        // Generate random license plate and VIN
        const licensePlate = `LP${Math.floor(Math.random() * 10000)}`;
        const vin = `VIN${Math.random().toString(36).substring(2, 17)}`;

        // Create vehicle record
        await prisma.vehicle.create({
            data: {
                customerid: Math.floor(Math.random() * 10) + 1, // Example: assuming you have 10 customers
                licenseplate: licensePlate,
                vin: vin,
                make: make,
                model: model,
                year: Math.floor(Math.random() * (2024 - 2000 + 1)) + 2000, // Random year between 2000 and 2024
                color: getRandomColor(), // Function to get random color
            },
        });
    }

    console.log('100 dummy vehicle records created.');
}

function getRandomColor() {
    const colors = ['Red', 'Blue', 'Green', 'Black', 'White', 'Silver', 'Gray'];
    return colors[Math.floor(Math.random() * colors.length)];
}

main()
    .catch(e => console.error(e))
    .finally(async () => {
        await prisma.$disconnect();
    });
