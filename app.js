const express = require("express");
const path = require('path');
const mysql = require("mysql");
const dotenv = require('dotenv');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');

dotenv.config(
{
  path: './.env'
});

const app = express();

const db = mysql.createConnection(
{
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE,
  dateStrings: 'date'
});

//__dirname : 사용중인 디렉토리
const publicDirectory = path.join(__dirname, './public');
console.log(__dirname);
app.use(express.static(publicDirectory));

// 인코딩된 url 파싱하기
app.use(express.urlencoded(
{
  extended: false
}));

// Json 바디 파싱하기
app.use(express.json());
app.use(cookieParser());

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');

db.connect((error) =>
{
  if (error)
  {
    console.log(error)
  }
  else
  {
    console.log("MYSQL Connected...")
  }
})

//Define Routes
app.use('/', require('./routes/pages'));
app.use('/auth', require('./routes/auth'));

app.listen(5001, () =>
{
  console.log("Server started on Port 5001");
})
