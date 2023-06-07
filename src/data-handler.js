import connection from '../config/db_connection.js'

const getTableColumn = dataType => {
  if (dataType === 'entries') return 'entryId'
  if (dataType === 'portfolio') return 'portfolioId'
  if (dataType === 'resumeItems') return 'resumeItemId'
  if (dataType === 'resumeDescriptions') return 'resumeDescriptionId'
}

const getAllItems = async dataType => {
  let query = `SELECT * FROM ${dataType}`
  const [rows] = await connection.execute(query)
  return rows
}

const getItemById = async (dataType, id) => {
  const tableColumn = getTableColumn(dataType)
  let query = `SELECT * FROM ${dataType} WHERE ${tableColumn} = ?`
  let queryVars = [id]
  const [rows] = await connection.execute(query, queryVars)
  // Convert to string, and check if blank
  if (rows.toString() === '') return false
  return rows
}

const addUser = async (dataType, data) => {
  let query = `INSERT INTO ${dataType} (userName, userPassword, userEmail, isAdmin)
  VALUES (?,?,?,?)`
  let queryVars = [
    data.userName,
    data.userPassword,
    data.userEmail,
    data.isAdmin
  ]
  const [rows] = await connection.execute(query, queryVars)
  return rows
}

const addItem = async (dataType, data) => {
  let query = `INSERT INTO ${dataType} (userName, userEmail, userPhoneNumber, entryContent)
  VALUES (?,?,?,?)`

  let queryVars = [
    data.userName,
    data.userEmail,
    data.userPhoneNumber,
    data.entryContent
  ]
  const [rows] = await connection.execute(query, queryVars)
  return rows
}

const addPortfolioItem = async (dataType, data) => {
  let query = `INSERT INTO ${dataType} (portfolioItemTitle, portfolioItemDesription, portfolioItemImageTag)
  VALUES (?,?,?)`
  let queryVars = [
    data.portfolioItemTitle,
    data.portfolioItemDesription,
    data.portfolioItemImageTag
  ]
  const [rows] = await connection.execute(query, queryVars)
  return rows
}

const addResumeItem = async (dataType, data) => {
  let query = `INSERT INTO ${dataType} (resumeItemType, resumeItem, resumeItemTitle)
  VALUES (?,?,?)`
  let queryVars = [data.resumeItemType, data.resumeItem, data.resumeItemTitle]
  const [rows] = await connection.execute(query, queryVars)
  return rows
}

const addResumeDescription = async (dataType, data) => {
  let query = `INSERT INTO ${dataType} (resumeItemId, resumeItemDescription)
  VALUES (?,?)`
  let queryVars = [data.resumeItemId, data.resumeItemDescription]
  const [rows] = await connection.execute(query, queryVars)
  return rows
}

const deleteItemById = async (dataType, id) => {
  const tableColumn = getTableColumn(dataType)
  // console.log(getTableColumn)
  let query = `DELETE FROM ${dataType} WHERE ${tableColumn}  = ?`
  let queryVars = [id]
  const [rows] = await connection.execute(query, queryVars)
  // Convert to string, and check if blank
  if (rows.toString() === '') return false
  return rows
}

export {
  getAllItems,
  getItemById,
  addItem,
  addPortfolioItem,
  addResumeItem,
  addResumeDescription,
  addUser,
  deleteItemById
}
