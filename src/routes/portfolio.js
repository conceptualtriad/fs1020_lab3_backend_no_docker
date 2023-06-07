import express from 'express'
import validateProps from '../middleware/validation.js'
import jwtVerify from '../middleware/jwt-verify.js'
import * as db from '../data-handler.js'
const app = express()

app.get('/', async (req, res) => {
  const portfolio = await db.getAllItems('portfolio')
  return res.status(200).json(portfolio)
})

app.get('/:id', async (req, res) => {
  const portfolioItemId = req.params.id
  const foundItem = await db.getItemById('portfolio', portfolioItemId)
  if (foundItem) return res.status(200).json(foundItem)
  return res.status(404).json({ message: `Entry ${portfolioItemId} not found` })
})

// Apply Validation middleware to route
// Apply JWT verification middleware to routes below
app.use(jwtVerify)
app.post('/', validateProps, async (req, res) => {
  // Create Entry object
  const newItem = {
    portfolioItemType: req.body.portfolioItemTitle,
    portfolioItemDescription: req.body.portfolioItemDescription,
    portfolioItemTitle: req.body.portfolioItemImageTag
  }
  await db.addPortfolioItem('portfolio', newItem)
  return res.status(201).json({ newItem })
})

// app.delete('/:id', async (req, res) => {
//   const portfolioId = req.params.id
//   const foundEntry = await db.getItemById('portfolio', portfolioId)
//   if (foundEntry) {
//     await db.deleteItemById('portfolio', portfolioId)
//     return res.status(204).json() // it is an empty response as this resource no longer exists
//   }
//   return res.status(404).json({ message: `Entry ${portfolioId} not found` })
// })

export default app
