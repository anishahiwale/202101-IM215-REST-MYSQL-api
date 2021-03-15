const { response } = require('express')
const express = require('express')
const morgan = require('morgan')
const bodyParser = require('body-parser');

const app = express()
app.use(morgan('dev'))
app.use(bodyParser.urlencoded({extended:false}));

const router_user = require('./routes/user.js')
app.use(router_user)

app.get('/', (request, response) => {
  response.send('Welcome')
})

// app.get('/', (request, response) => {
//   // console.log('Request Received') 
//   // response.send('Welcome');
//   // response.json({msg: 'Welcome'});

//   /** 
//    * Types of Parameters:
//    * Query param1=val1&param2=val2
//    * Route localhost:3333/name/val1/age/val2/birthday/val3....
//    * Body param1=val1&param2=val2 (if using form)
//   */

//   // Query
//   // console.log('Query Parameters')
//   // console.log(request.query)

//   // Body
//   console.log('Body Parameters')
//   console.log(request.body)

//   response.end()
// })

// app.get('/:first_name/:last_name/:age', (request, response) => {

//   // Route
//   console.log('Route Parameters')
//   console.log(request.params) 

//   response.end()
// })

// app.get('/id/:user_id', (request, response) => {
  
//   console.log('##### GET METHOD')

//   // Query
//   console.log('Query Parameters')
//   console.log(request.query)

//   // Route
//   console.log('Route Parameters')
//   console.log(request.params) 

//   // Body
//   console.log('Body Parameters')
//   console.log(request.body)

//   response.end()
// })

// app.post('/id/:user_id', (request, response) => {

//   console.log('#### POST METHOD')


//   // Query
//   console.log('Query Parameters')
//   console.log(request.query)

//   // Route
//   console.log('Route Parameters')
//   console.log(request.params) 

//   // Body
//   console.log('Body Parameters')
//   console.log(request.body)

//   response.end()
// })

// app.put('/id/:user_id', (request, response) => {

//   console.log('#### PUT METHOD')


//   // Query
//   console.log('Query Parameters')
//   console.log(request.query)

//   // Route
//   console.log('Route Parameters')
//   console.log(request.params) 

//   // Body
//   console.log('Body Parameters')
//   console.log(request.body)

//   response.end()
// })

// app.patch('/id/:user_id', (request, response) => {

//   console.log('#### PATCH METHOD')


//   // Query
//   console.log('Query Parameters')
//   console.log(request.query)

//   // Route
//   console.log('Route Parameters')
//   console.log(request.params) 

//   // Body
//   console.log('Body Parameters')
//   console.log(request.body)

//   response.end()
// })

// app.delete('/id/:user_id', (request, response) => {

//   console.log('#### DELETE METHOD')


//   // Query
//   console.log('Query Parameters')
//   console.log(request.query)

//   // Route
//   console.log('Route Parameters')
//   console.log(request.params) 

//   // Body
//   console.log('Body Parameters')
//   console.log(request.body)

//   response.end()
// })

// app.options('/id/:user_id', (request, response) => {

//   console.log('#### OPTIONS METHOD')


//   // Query
//   console.log('Query Parameters')
//   console.log(request.query)

//   // Route
//   console.log('Route Parameters')
//   console.log(request.params) 

//   // Body
//   console.log('Body Parameters')
//   console.log(request.body)

//   response.end()
// })

// app.head('/id/:user_id', (request, response) => {

//   console.log('#### HEAD METHOD')


//   // Query
//   console.log('Query Parameters')
//   console.log(request.query)

//   // Route
//   console.log('Route Parameters')
//   console.log(request.params) 

//   // Body
//   console.log('Body Parameters')
//   console.log(request.body)

//   response.end()
// })

app.listen(3333, () => {
  console.log('The server is up and listening on port 3333')
})