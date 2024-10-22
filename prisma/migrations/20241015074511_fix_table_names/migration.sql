/*
  Warnings:

  - You are about to drop the `Compensation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Vehicle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `customers_info` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Compensation" DROP CONSTRAINT "compensation_vehicleid_fkey";

-- DropForeignKey
ALTER TABLE "Vehicle" DROP CONSTRAINT "Vehicle_customerid_fkey";

-- DropForeignKey
ALTER TABLE "policies" DROP CONSTRAINT "policies_customer_id_fkey";

-- DropTable
DROP TABLE "Compensation";

-- DropTable
DROP TABLE "Vehicle";

-- DropTable
DROP TABLE "customers_info";

-- CreateTable
CREATE TABLE "compensation" (
    "compensationid" SERIAL NOT NULL,
    "vehicleid" INTEGER NOT NULL,
    "claimdate" DATE NOT NULL,
    "claimamount" DECIMAL(15,2) NOT NULL,
    "compensationtype" VARCHAR(50),
    "description" TEXT,

    CONSTRAINT "compensation_pkey" PRIMARY KEY ("compensationid")
);

-- CreateTable
CREATE TABLE "customer_info" (
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
CREATE TABLE "vehicle" (
    "vehicleid" SERIAL NOT NULL,
    "customerid" INTEGER NOT NULL,
    "licenseplate" VARCHAR(15) NOT NULL,
    "vin" VARCHAR(17) NOT NULL,
    "make" VARCHAR(50),
    "model" VARCHAR(50),
    "year" INTEGER,
    "color" VARCHAR(30),

    CONSTRAINT "vehicle_pkey" PRIMARY KEY ("vehicleid")
);

-- CreateIndex
CREATE UNIQUE INDEX "customerinfo_email_key" ON "customer_info"("email");

-- CreateIndex
CREATE UNIQUE INDEX "vehicle_licenseplate_key" ON "vehicle"("licenseplate");

-- CreateIndex
CREATE UNIQUE INDEX "vehicle_vin_key" ON "vehicle"("vin");

-- AddForeignKey
ALTER TABLE "compensation" ADD CONSTRAINT "compensation_vehicleid_fkey" FOREIGN KEY ("vehicleid") REFERENCES "vehicle"("vehicleid") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "vehicle" ADD CONSTRAINT "vehicle_customerid_fkey" FOREIGN KEY ("customerid") REFERENCES "customer_info"("customer_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "policies" ADD CONSTRAINT "policies_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer_info"("customer_id") ON DELETE SET NULL ON UPDATE CASCADE;
