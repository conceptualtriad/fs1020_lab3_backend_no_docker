import * as dotenv from 'dotenv'
dotenv.config()
import mysql2 from 'mysql2/promise'

// Create database connection
const configuration = {
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE_NAME
}

const connection = await mysql2.createConnection(configuration)

export default connection
