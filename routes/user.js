const { query } = require('express')
const express = require('express')
const router = express.Router()

const mysql = require('mysql')

function getNewConnection() {
  return mysql.createConnection({
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'password',
      database: '202101-IM215-REST',
}) }


const users = [
  {first_name: 'John', last_name: 'Doe', age: 31},
  {first_name: 'Petter', last_name: 'Jackson', age: 21},
]

router.get('/user', (request, response) => {

  const connection = getNewConnection();
  const queryString = 'Select * FROM user'

  connection.query(queryString, (err, rows, fields) => {
    if (err != null) {
      console.error(err)
      response.sendStatus(500);
    } else {
      response.json(rows);
    }
  })





  // response.json(users)
  // response.sendStatus(501)
  // response.status(501).end()
  // response.status(501).json(
  //   {
  //     msg: 'Not implemented',
  //     display: 'alert-error'
  //   }
  // )
})

router.get('/user/:id', (request, response) => {
  console.log(request.params)
  const {id} = request.params 
  response.json(users[id])
})

router.post('/user', (request, response) => {

  const {first_name, last_name, age} = request.body
  const queryString = `INSERT INTO user VALUES (NULL, '${first_name}', '${last_name}', ${age})`
  
  const connection = getNewConnection()
  connection.query(queryString, (err, result, fields) => {
    console.log('Got a Response from our Database Server')
    if (err != null) {
      console.error(err)
      response.sendStatus(500);
    } else {
      console.log(result)
      response.json({id: result.insertId})
    }
  })
})

router.delete('/user/:id', (request, response) => {
  console.log(request.params)
  const {id} = request.params
  users.splice(id, 1)
  response.end()
})


module.exports = router
