const express = require('express')
const morgan = require('morgan')
var cors = require('cors');
const bodyParser = require('body-parser');

const app = express()
app.use(morgan('dev'))
app.use(bodyParser.urlencoded({extended:false}));
app.use(express.json())
app.use(cors());

app.use(express.static('./public'))

const router_user = require('./routes/user.js')
app.use(router_user)

// app.get('/', (request, response) => {
//   response.send('Welcome')
// })

app.listen(3987, () => {
  console.log('API is running at ' + 'http://localhost:3987/');
})
