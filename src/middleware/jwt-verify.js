import jwt from 'jsonwebtoken'

export default async (req, res, next) => {
  const authHeader = req.headers['authorization']
  // Parse string to get just the token, if there is an authorization
  const token = authHeader && authHeader.split(' ')[1]
  try {
    jwt.verify(token, process.env.JWT_SECRET)
    next()
  } catch (err) {
    return res.status(401).json({ message: err.message })
  }
}
