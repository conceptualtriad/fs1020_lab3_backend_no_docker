import * as dotenv from 'dotenv'
import express from 'express'
import cors from 'cors'

import portfolio from './src/routes/portfolio.js'
import resume from './src/routes/resume.js'
import contactForm from './src/routes/contact-form.js'
import users from './src/routes/users.js'
import errorHandler from './src/middleware/error-handler.js'

dotenv.config()
// Default port is 4000, if no Environment Variable set
const port = process.env.ENV_PORT || 4000

const app = express()
app.use(cors())
app.use(express.json())

app.get('/', async (req, res) => {
  return res.status(200).json('hello world')
})

app.use('/resume', resume)
app.use('/portfolio', portfolio)
app.use('/contact_form', contactForm)
app.use('/users', users)
app.use(errorHandler)

app.listen(port, () =>
  console.log(`API server ready on http://localhost:${port}`)
)

export default app
