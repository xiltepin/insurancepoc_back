/*
  Warnings:

  - You are about to drop the `PolicyHolder` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "PolicyHolder" DROP CONSTRAINT "policyholder_customerid_fkey";

-- DropForeignKey
ALTER TABLE "Vehicle" DROP CONSTRAINT "vehicle_policyholderid_fkey";

-- DropTable
DROP TABLE "PolicyHolder";

-- DropTable
DROP TABLE "User";
