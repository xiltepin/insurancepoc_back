/*
  Warnings:

  - You are about to drop the `policies` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "policies" DROP CONSTRAINT "policies_customer_id_fkey";

-- DropTable
DROP TABLE "policies";

-- CreateTable
CREATE TABLE "policy" (
    "policy_id" SERIAL NOT NULL,
    "startdate" TIMESTAMP(3) NOT NULL,
    "enddate" TIMESTAMP(3) NOT NULL,
    "contract_status" "ContractStatus" NOT NULL,
    "second_vehicle" BOOLEAN NOT NULL,
    "premium" DOUBLE PRECISION NOT NULL,
    "customer_id" INTEGER,

    CONSTRAINT "policy_pkey" PRIMARY KEY ("policy_id")
);

-- AddForeignKey
ALTER TABLE "policy" ADD CONSTRAINT "policy_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer_info"("customer_id") ON DELETE SET NULL ON UPDATE CASCADE;
