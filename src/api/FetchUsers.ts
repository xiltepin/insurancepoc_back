import { PrismaClient } from '@prisma/client';
import { env } from 'process';



const prismaClient = new PrismaClient({
datasources: {
      db:{
        url = env("DATABASE_URL")
        //env("DATABASE_URL")env("DATABASE_URL")
      },
},
})



// generator client {
//       provider = "prisma-client-js"
//     }
    
//     datasource db {
//       provider = "postgresql"
//       url      = env("DATABASE_URL")
//     }  