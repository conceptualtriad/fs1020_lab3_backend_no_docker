import express from 'express'
import { v4 as uuidv4 } from 'uuid'
import validateProps from '../middleware/validation.js'
import jwt from 'jsonwebtoken'
import argon2 from 'argon2'
import * as db from '../data-handler.js'
const app = express()

// Apply Validation middleware to route
app.post('/', validateProps, async (req, res) => {
  // Create User object
  const newUser = {
    // id: uuidv4(),
    userName: req.body.userName,
    userPassword: await argon2.hash(req.body.userPassword),
    // Convert email characters to lower case
    userEmail: req.body.userEmail.toLowerCase(),
    isAdmin: req.body.isAdmin
  }

  await db.addUser('users', newUser)
  // Destructure object, to exclude password property from returned object
  const { userPassword, ...otherProps } = newUser
  return res.status(201).json(otherProps)
})

app.post('/auth', async (req, res) => {
  const userEmail = req.body.userEmail
  const users = await db.getAllItems('users')
  // Destructure object, to only use {email} property
  const userFound = users.find(user => user.userEmail === userEmail)
  // If user exists and password matches, return token
  if (
    userFound &&
    (await argon2.verify(userFound.userPassword, req.body.userPassword))
  ) {
    const token = jwt.sign({ userEmail }, process.env.JWT_SECRET, {
      // const token = jwt.sign( req.body.userEmail, process.env.JWT_SECRET, {
      expiresIn: '20m'
    })
    return res.json({ token })
  }
  return res.status(401).json({ message: 'incorrect credentials provided' })
})

export default app
