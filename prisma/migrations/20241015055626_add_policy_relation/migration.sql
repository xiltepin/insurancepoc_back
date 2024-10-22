/*
  Warnings:

  - You are about to drop the `CustomerInfo` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "ContractStatus" AS ENUM ('CURRENTLY_ENROLLED_1_YEAR', 'FIRST_TIME', 'CURRENTLY_ENROLLED_OTHER', 'EXPIRED', 'CURRENTLY_ENROLLED_WITH_CLAIM');

-- DropForeignKey
ALTER TABLE "Vehicle" DROP CONSTRAINT "Vehicle_customerid_fkey";

-- DropTable
DROP TABLE "CustomerInfo";

-- CreateTable
CREATE TABLE "customers_info" (
    "customer_id" SERIAL NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "address" TEXT,
    "phone_number" VARCHAR(15),
    "email" VARCHAR(100),

    CONSTRAINT "customerinfo_pkey" PRIMARY KEY ("customer_id")
);

-- CreateTable
CREATE TABLE "policies" (
    "policy_id" SERIAL NOT NULL,
    "startdate" TIMESTAMP(3) NOT NULL,
    "enddate" TIMESTAMP(3) NOT NULL,
    "contract_status" "ContractStatus" NOT NULL,
    "second_vehicle" BOOLEAN NOT NULL,
    "premium" DOUBLE PRECISION NOT NULL,
    "customer_id" INTEGER,

    CONSTRAINT "policies_pkey" PRIMARY KEY ("policy_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "customerinfo_email_key" ON "customers_info"("email");

-- AddForeignKey
ALTER TABLE "Vehicle" ADD CONSTRAINT "Vehicle_customerid_fkey" FOREIGN KEY ("customerid") REFERENCES "customers_info"("customer_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "policies" ADD CONSTRAINT "policies_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customers_info"("customer_id") ON DELETE SET NULL ON UPDATE CASCADE;
