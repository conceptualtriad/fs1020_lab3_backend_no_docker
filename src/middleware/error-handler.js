const errorHandler = (req, res, next) => {
  try {
    return res.status(404).send({ message: 'not found' })
  } catch (err) {
    return res.status(401).send({ message: err.message })
  }
}

export default errorHandler
