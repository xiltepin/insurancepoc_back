/*
  Warnings:

  - You are about to drop the `compensation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `customerinfo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `policyholder` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `vehicle` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "compensation" DROP CONSTRAINT "compensation_vehicleid_fkey";

-- DropForeignKey
ALTER TABLE "policyholder" DROP CONSTRAINT "policyholder_customerid_fkey";

-- DropForeignKey
ALTER TABLE "vehicle" DROP CONSTRAINT "vehicle_policyholderid_fkey";

-- DropTable
DROP TABLE "compensation";

-- DropTable
DROP TABLE "customerinfo";

-- DropTable
DROP TABLE "policyholder";

-- DropTable
DROP TABLE "vehicle";

-- CreateTable
CREATE TABLE "Compensation" (
    "compensationid" SERIAL NOT NULL,
    "vehicleid" INTEGER NOT NULL,
    "claimdate" DATE NOT NULL,
    "claimamount" DECIMAL(15,2) NOT NULL,
    "compensationtype" VARCHAR(50),
    "description" TEXT,

    CONSTRAINT "compensation_pkey" PRIMARY KEY ("compensationid")
);

-- CreateTable
CREATE TABLE "CustomerInfo" (
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
CREATE TABLE "PolicyHolder" (
    "policyholderid" SERIAL NOT NULL,
    "customerid" INTEGER NOT NULL,
    "policynumber" VARCHAR(50) NOT NULL,
    "policystartdate" DATE NOT NULL,
    "policyenddate" DATE NOT NULL,
    "coveragetype" VARCHAR(50),
    "premiumamount" DECIMAL(10,2) NOT NULL,

    CONSTRAINT "policyholder_pkey" PRIMARY KEY ("policyholderid")
);

-- CreateTable
CREATE TABLE "Vehicle" (
    "vehicleid" SERIAL NOT NULL,
    "policyholderid" INTEGER NOT NULL,
    "licenseplate" VARCHAR(15) NOT NULL,
    "vin" VARCHAR(17) NOT NULL,
    "make" VARCHAR(50),
    "model" VARCHAR(50),
    "year" INTEGER,
    "color" VARCHAR(30),

    CONSTRAINT "vehicle_pkey" PRIMARY KEY ("vehicleid")
);

-- CreateIndex
CREATE UNIQUE INDEX "customerinfo_email_key" ON "CustomerInfo"("email");

-- CreateIndex
CREATE UNIQUE INDEX "policyholder_policynumber_key" ON "PolicyHolder"("policynumber");

-- CreateIndex
CREATE UNIQUE INDEX "vehicle_licenseplate_key" ON "Vehicle"("licenseplate");

-- CreateIndex
CREATE UNIQUE INDEX "vehicle_vin_key" ON "Vehicle"("vin");

-- AddForeignKey
ALTER TABLE "Compensation" ADD CONSTRAINT "compensation_vehicleid_fkey" FOREIGN KEY ("vehicleid") REFERENCES "Vehicle"("vehicleid") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "PolicyHolder" ADD CONSTRAINT "policyholder_customerid_fkey" FOREIGN KEY ("customerid") REFERENCES "CustomerInfo"("customer_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Vehicle" ADD CONSTRAINT "vehicle_policyholderid_fkey" FOREIGN KEY ("policyholderid") REFERENCES "PolicyHolder"("policyholderid") ON DELETE CASCADE ON UPDATE NO ACTION;
