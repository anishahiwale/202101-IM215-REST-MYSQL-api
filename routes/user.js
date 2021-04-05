const { query } = require('express')
const express = require('express')
const router = express.Router()

const mysql = require('mysql')

const pool = mysql.createPool({
  connectionLimit: 5,
  host:'localhost',
  user:'root',
  password:'root',
  database:'donationdb'
});

function getNewConnection() {
  return pool
}


router.get('/donor', (request, response) => {

  const connection = getNewConnection();
  const queryString = 'Select * FROM tbl_donorinfo'

  connection.query(queryString, (err, rows, fields) => {
    if (err != null) {
      console.error(err)
      response.sendStatus(500);
    } else {
      response.json(rows);
    }
  })
})

router.get('/donor/:id', (request, response) => {
  const {id} = request.params 
  const connection = getNewConnection();
  const queryString = `Select * FROM tbl_donorinfo where id = ${id}`

  connection.query(queryString, (err, rows, fields) => {
    if (err != null) {
      console.error(err)
      response.sendStatus(500);
    } else {
      response.json(rows[0]);
    }
  }) 
})

// router.post('/user', (request, response) => {

//   const {first_name, last_name, age} = request.body
//   const queryString = `INSERT INTO user VALUES (NULL, '${first_name}', '${last_name}', ${age})`

//   const connection = getNewConnection()
//   connection.query(queryString, (err, result, fields) => {
//     console.log('Got a Response from our Database Server')
//     if (err != null) {
//       console.error(err)
//       response.sendStatus(500);
//     } else {
//       console.log(result)
//       response.json({id: result.insertId})
//     }
//   })
// })

router.delete('/donor/:id', (request, response) => {
  const {id} = request.params

  const connection = getNewConnection();
  const queryString = `Delete FROM tbl_donorinfo where id = ${id}`

  connection.query(queryString, (err, result, fields) => {
    if (err != null) {
      console.error(err)
      response.sendStatus(500);
    } else {
      // As exercise check if user was actually removed. 
      console.log(result)
      response.end()
    }
  }) 
})


router.post('/register', (request, response) => {

  // const {username, firstname, lastname , gender , Dob, password , street , zipcode , city , country , phone, emailid} = request.body
  // const queryString = `INSERT INTO tbl_donorinfo(username , firstname , lastname) VALUES ('donor', '${username}', '${firstname}',${lastname})`
  let body = request.body;
  const queryString = 'CALL USP_CRUD_Donorinfo(?,?,?,?,?,?,?,?,?,?,?,?,?)';
  const connection = getNewConnection()
  connection.query(queryString, [body.username,body.firstname,body.lastname,body.gender,body.Dob,
    body.password,body.street,body.zipcode,body.city,
    body.country,body.phone,body.emailid,'insert'] ,(err, result, fields) => {
    console.log('Got a Response from our Database Server')
    if (err != null) {
      console.error(err)
      // response.sendStatus(500);
    } else {
      response.json(JSON.parse(JSON.stringify(result)))
    }
  })
})


router.post('/updateprofile', (request, response) => {

  // const {username, firstname, lastname , gender , Dob, password , street , zipcode , city , country , phone, emailid} = request.body
  // const queryString = `INSERT INTO tbl_donorinfo(username , firstname , lastname) VALUES ('donor', '${username}', '${firstname}',${lastname})`
  let body = request.body;
  const queryString = 'CALL USP_CRUD_Donorinfo(?,?,?,?,?,?,?,?,?,?,?,?,?)';
  const connection = getNewConnection()
  connection.query(queryString, [body.username,body.firstname,body.lastname,body.gender,body.Dob,
    body.password,body.street,body.zipcode,body.city,
    body.country,body.phone,body.emailid,'update'] ,(err, result, fields) => {
    console.log('Got a Response from our Database Server')
    if (err != null) {
      console.error(err)
      // response.sendStatus(500);
    } else {
      response.json(JSON.parse(JSON.stringify(result)))
    }
  })
})


router.post('/UpdatePassword', (request, response) => {

  // const {username, firstname, lastname , gender , Dob, password , street , zipcode , city , country , phone, emailid} = request.body
  // const queryString = `INSERT INTO tbl_donorinfo(username , firstname , lastname) VALUES ('donor', '${username}', '${firstname}',${lastname})`
  let body = request.body;
  const queryString = 'CALL USP_Login_Update(?,?,?)';
  const connection = getNewConnection()
  connection.query(queryString, [body.username,body.password,'update'] ,(err, result, fields) => {
    console.log('Got a Response from our Database Server')
    if (err != null) {
      console.error(err)
      // response.sendStatus(500);
    } else {
      response.json(JSON.parse(JSON.stringify(result)))
    }
  })
})


router.post('/logincheck', (request, response) => {

  // const {username, firstname, lastname , gender , Dob, password , street , zipcode , city , country , phone, emailid} = request.body
  // const queryString = `INSERT INTO tbl_donorinfo(username , firstname , lastname) VALUES ('donor', '${username}', '${firstname}',${lastname})`
  let body = request.body;
  const queryString = 'CALL USP_Login_Update(?,?,?)';
  const connection = getNewConnection()
  connection.query(queryString, [body.username,body.password,'Login'] ,(err, result, fields) => {
    console.log('Got a Response from our Database Server')
    if (err != null) {
      console.error(err)
      // response.sendStatus(500);
    } else {
      response.json(JSON.parse(JSON.stringify(result)))
    }
  })
})


module.exports = router
