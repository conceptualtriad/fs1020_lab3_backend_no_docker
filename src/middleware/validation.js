const validateEmailFormat = email => {
  // RegEx -- Check valid format, '@' and '.' position, TLD is 2 to 4 characters
  const pattern =
    /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,4}))$/
  return pattern.test(email)
}

const validatePasswordFormat = password => {
  // RegEx -- Minimum 8 characters
  const pattern = /^.{8,}$/
  return pattern.test(password)
}

const getRequiredProps = path => {
  // let requiredProps = ['userName', 'userEmail']
  let requiredProps = ['userName', 'userEmail']
  // Add required properties, depending on full route
  if (path === '/contact_form/entries')
    requiredProps.push('userPhoneNumber', 'entryContent')
  if (path === '/users') requiredProps.push('userPassword', 'isAdmin')
  if (
    path === '/resume/resume-items' ||
    path === '/resume/resume-descriptions' ||
    path === '/portfolio'
  )
    requiredProps = []
  console.log(path, requiredProps)
  return requiredProps
}

const validateProps = (req, res, next) => {
  // Pass full URL to function, excluding base URL
  const requiredProps = getRequiredProps(req.originalUrl)
  const invalidProps = []

  requiredProps.forEach(prop => {
    if (
      // Validate email OR password OR missing property
      (prop === 'userEmail' && !validateEmailFormat(req.body.userEmail)) ||
      (prop === 'userPassword' &&
        !validatePasswordFormat(req.body.userPassword)) ||
      req.body[prop] === '' ||
      !req.body.hasOwnProperty(prop)
    )
      invalidProps.push(prop)
  })

  if (invalidProps.length) {
    // Return message if there are any invalid properties
    return res
      .status(400)
      .json({ message: 'validation error', invalid: invalidProps })
  }
  next()
}

export default validateProps
