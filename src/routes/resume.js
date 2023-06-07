import express from 'express'
import validateProps from '../middleware/validation.js'
import jwtVerify from '../middleware/jwt-verify.js'
import * as db from '../data-handler.js'
const app = express()

app.get('/resume-items', async (req, res) => {
  const resumeItems = await db.getAllItems('resumeItems')
  return res.status(200).json(resumeItems)
})

app.get('/resume-items/:id', async (req, res) => {
  const resumeItemId = req.params.id
  const foundItem = await db.getItemById('resumeItems', resumeItemId)
  if (foundItem) return res.status(200).json(foundItem)
  return res.status(404).json({ message: `Entry ${resumeItemId} not found` })
})

app.get('/resume-descriptions', async (req, res) => {
  const resumeDescriptions = await db.getAllItems('resumeDescriptions')
  return res.status(200).json(resumeDescriptions)
})

app.get('/resume-descriptions/:id', async (req, res) => {
  const resumeDescriptionId = req.params.id
  const foundItem = await db.getItemById(
    'resumeDescriptions',
    resumeDescriptionId
  )
  if (foundItem) return res.status(200).json(foundItem)
  return res
    .status(404)
    .json({ message: `Entry ${resumeDescriptionId} not found` })
})

// Apply Validation middleware to route
// Apply JWT verification middleware to routes below
app.use(jwtVerify)
app.post('/resume-items', validateProps, jwtVerify, async (req, res) => {
  // Create Entry object
  const newItem = {
    resumeItemType: req.body.resumeItemType,
    resumeItem: req.body.resumeItem,
    resumeItemTitle: req.body.resumeItemTitle
  }
  await db.addResumeItem('resumeItems', newItem)
  return res.status(201).json({ newItem })
})

app.delete('/resume-items/:id', async (req, res) => {
  const resumeItemId = req.params.id
  const foundEntry = await db.getItemById('resumeItems', resumeItemId)
  if (foundEntry) {
    await db.deleteItemById('resumeItems', resumeItemId)
    return res.status(204).json() // it is an empty response as this resource no longer exists
  }
  return res.status(404).json({ message: `Entry ${resumeItemId} not found` })
})

export default app
