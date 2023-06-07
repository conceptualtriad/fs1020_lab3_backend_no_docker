import express from 'express'
import validateProps from '../middleware/validation.js'
import jwtVerify from '../middleware/jwt-verify.js'
import * as db from '../data-handler.js'
const app = express()

// Apply Validation middleware to route
app.post('/entries', validateProps, async (req, res) => {
  // Create Entry object
  const newEntry = {
    userName: req.body.userName,
    // Convert email characters to lower case
    userEmail: req.body.userEmail.toLowerCase(),
    userPhoneNumber: req.body.userPhoneNumber,
    entryContent: req.body.entryContent
  }
  await db.addItem('entries', newEntry)
  return res.status(201).json({ newEntry })
})

// Apply JWT verification middleware to routes below
app.use(jwtVerify)

app.get('/entries', async (req, res) => {
  const entries = await db.getAllItems('entries')
  return res.status(200).json(entries)
})

app.get('/entries/:id', async (req, res) => {
  const entryId = req.params.id
  const foundEntry = await db.getItemById('entries', entryId)
  if (foundEntry) return res.status(200).json(foundEntry)
  return res.status(404).json({ message: `Entry ${entryId} not found` })
})

app.delete('/entries/:id', async (req, res) => {
  const entryId = req.params.id
  const foundEntry = await db.getItemById('entries', entryId)
  if (foundEntry) {
    await db.deleteItemById('entries', entryId)
    return res.status(204).json() // it is an empty response as this resource no longer exists
  }
  return res.status(404).json({ message: `Entry ${entryId} not found` })
})

export default app
