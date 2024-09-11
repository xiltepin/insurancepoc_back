-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "user_pk" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "customerinfo" (
    "customerid" SERIAL NOT NULL,
    "firstname" VARCHAR(50) NOT NULL,
    "lastname" VARCHAR(50) NOT NULL,
    "dateofbirth" DATE NOT NULL,
    "address" TEXT,
    "phonenumber" VARCHAR(15),
    "email" VARCHAR(100),

    CONSTRAINT "customerinfo_pkey" PRIMARY KEY ("customerid")
);

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
CREATE TABLE "policyholder" (
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
CREATE TABLE "vehicle" (
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
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "customerinfo_email_key" ON "customerinfo"("email");

-- CreateIndex
CREATE UNIQUE INDEX "policyholder_policynumber_key" ON "policyholder"("policynumber");

-- CreateIndex
CREATE UNIQUE INDEX "vehicle_licenseplate_key" ON "vehicle"("licenseplate");

-- CreateIndex
CREATE UNIQUE INDEX "vehicle_vin_key" ON "vehicle"("vin");

-- AddForeignKey
ALTER TABLE "compensation" ADD CONSTRAINT "compensation_vehicleid_fkey" FOREIGN KEY ("vehicleid") REFERENCES "vehicle"("vehicleid") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "policyholder" ADD CONSTRAINT "policyholder_customerid_fkey" FOREIGN KEY ("customerid") REFERENCES "customerinfo"("customerid") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "vehicle" ADD CONSTRAINT "vehicle_policyholderid_fkey" FOREIGN KEY ("policyholderid") REFERENCES "policyholder"("policyholderid") ON DELETE CASCADE ON UPDATE NO ACTION;
