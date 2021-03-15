const express = require('express')
const router = express.Router()

module.exports = router

const users = [
  {first_name: 'John', last_name: 'Doe', age: 31},
  {first_name: 'Petter', last_name: 'Jackson', age: 21},
]

router.get('/user', (request, response) => {
  response.json(users)
})

router.get('/user/:id', (request, response) => {
  console.log(request.params)
  const {id} = request.params 
  response.json(users[id])
})

router.post('/user', (request, response) => {
  console.log(request.body) 
  const {first_name, last_name, age} = request.body
  users.push({first_name, last_name, age})
  response.end()
})

router.delete('/user/:id', (request, response) => {
  console.log(request.params)
  const {id} = request.params
  users.splice(id, 1)
  response.end()
})
