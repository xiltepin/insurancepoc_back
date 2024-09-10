
## Description

[Reference] https://medium.com/@itsuki.enjoy/postgresql-with-next-js-and-prisma-44f66a05378a

## Project setup

```bash
$ npm install
```

## Compile and run the project

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Run tests

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov

#install validator and transformer. It will help to validate the body
$ npm i --save class-validator class-transformer

## Resources

#Data table script

Tables and Schema
CustomerInfo Table:

Stores general information about the customers.
sql
Copy code
CREATE TABLE CustomerInfo (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address TEXT,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);
PolicyHolder Table:

Stores policy details and links to CustomerInfo.
sql
Copy code
CREATE TABLE PolicyHolder (
    PolicyHolderID SERIAL PRIMARY KEY,
    CustomerID INT NOT NULL,
    PolicyNumber VARCHAR(50) UNIQUE NOT NULL,
    PolicyStartDate DATE NOT NULL,
    PolicyEndDate DATE NOT NULL,
    CoverageType VARCHAR(50),
    PremiumAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES CustomerInfo(CustomerID) ON DELETE CASCADE
);
Vehicle Table:

Stores information about the vehicles covered by policies.
sql
Copy code
CREATE TABLE Vehicle (
    VehicleID SERIAL PRIMARY KEY,
    PolicyHolderID INT NOT NULL,
    LicensePlate VARCHAR(15) UNIQUE NOT NULL,
    VIN VARCHAR(17) UNIQUE NOT NULL,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    Color VARCHAR(30),
    FOREIGN KEY (PolicyHolderID) REFERENCES PolicyHolder(PolicyHolderID) ON DELETE CASCADE
);
Compensation Table:

Stores compensation details related to claims.
sql
Copy code
CREATE TABLE Compensation (
    CompensationID SERIAL PRIMARY KEY,
    VehicleID INT NOT NULL,
    ClaimDate DATE NOT NULL,
    ClaimAmount DECIMAL(15, 2) NOT NULL,
    CompensationType VARCHAR(50) CHECK (CompensationType IN ('Body Damage', 'Total Loss')),
    Description TEXT,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID) ON DELETE CASCADE
);
Relationships and Constraints
CustomerInfo to PolicyHolder: One-to-Many relationship (one customer can have multiple policies).
PolicyHolder to Vehicle: One-to-Many relationship (one policyholder can insure multiple vehicles).
Vehicle to Compensation: One-to-Many relationship (one vehicle can have multiple compensations).
Notes
Primary Key: Unique identifier for each record.
Foreign Key: Establishes relationships between tables.
Constraints: Ensure data integrity (e.g., NOT NULL, UNIQUE, CHECK).