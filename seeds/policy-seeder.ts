import { PrismaClient, ContractStatus } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
    const policies = [];

    // Generar 10 registros de políticas
    for (let i = 0; i < 10; i++) {
        const customerId = Math.floor(Math.random() * 100) + 1; // customer_id entre 1 y 100
        const startDate = new Date();
        const endDate = new Date();
        endDate.setFullYear(startDate.getFullYear() + 1); // 1 año de duración

        policies.push({
            startdate: startDate,
            enddate: endDate,
            contract_status: getRandomContractStatus(),
            second_vehicle: Math.random() < 0.5, // 50% de probabilidad de tener un segundo vehículo
            premium: parseFloat((Math.random() * 1000 + 100).toFixed(2)), // Premium entre 100 y 1100
            customer_id: customerId,
        });
    }

    for (const policy of policies) {
        await prisma.policy.create({
            data: policy,
        });
    }

    console.log('Dummy data for policies created successfully!');
}

function getRandomContractStatus(): ContractStatus {
    const statuses = [
        ContractStatus.CURRENTLY_ENROLLED_1_YEAR,
        ContractStatus.FIRST_TIME,
        ContractStatus.CURRENTLY_ENROLLED_OTHER,
        ContractStatus.EXPIRED,
        ContractStatus.CURRENTLY_ENROLLED_WITH_CLAIM,
    ];
    const randomIndex = Math.floor(Math.random() * statuses.length);
    return statuses[randomIndex];
}

main()
    .catch((e) => {
        console.error(e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
