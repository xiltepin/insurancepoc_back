/*
  Warnings:

  - You are about to drop the column `policyholderid` on the `Vehicle` table. All the data in the column will be lost.
  - Added the required column `customerid` to the `Vehicle` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Vehicle" DROP COLUMN "policyholderid",
ADD COLUMN     "customerid" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Vehicle" ADD CONSTRAINT "Vehicle_customerid_fkey" FOREIGN KEY ("customerid") REFERENCES "CustomerInfo"("customer_id") ON DELETE CASCADE ON UPDATE NO ACTION;
