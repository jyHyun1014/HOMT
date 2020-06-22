const express = require("express");
const mysql = require("mysql");
const jwt = require("jsonwebtoken");
const bodyParser = require("body-parser")
const cookieParser = require('cookie-parser');

const app = express();

app.use(express.json());
app.use(cookieParser());

const db = mysql.createConnection(
{
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE,
  dateStrings: 'date'
});

// 완전히 서버이다(쿠키와 같은 클라이언트와 연결될 수 있는 외부 데이터를 불러오기 어려움)
// POST, GET으로 얻을 수 있는 내용만 불러올 수 있음

// 문자열 비교함수
function comp(str1, str2)
{
  if (str1 === str2)
  {
    return true;
  }
  else
  {
    return false;
  }
}

// 로그인 과정입니다
exports.login = async (req, res) =>
{
  try
  {
    const
    {
      email,
      password
    } = req.body;

    if (!email || !password)
    {
      return res.status(400).render('index');
    }

    db.query('SELECT * FROM user WHERE email = ?', [email], async (error, results) =>
    {
      console.log(results);

      if ((results.length <= 0) || !(await comp(password, results[0].password)))
      {
        res.status(401).render('index');
      }
      else
      {
        const user = results[0];
        // token 전부 삭제
        // 백엔드(서버)는 프론트(클라이언트, 즉 출력화면)와 로컬스토리지를 공유하지 않음
        // 쿠키 유효기간은 하루
        const cookieOptions = {
          expires: new Date(
            Date.now() + process.env.JWT_COOKIE_EXPIRES * 24 * 60 * 60 * 1000
          )
        }

        res.cookie('user',
        {
          no: user.no,
          gender: user.gender,
          firstname: user.firstname,
          lastname: user.lastname,
          email: user.email,
          password: user.password,
          phone: user.phone,
          birth: user.birth,
          height: user.height,
          weight: user.weight
        }, cookieOptions);

        console.log('Cookies: ', req.cookies);

        res.status(200).redirect("/main");
      }
    });

  }
  catch (error)
  {
    console.log(error);
  }
}


// 회원가입 과정입니다
exports.register = (req, res) =>
{
  console.log(req.body);

  //  const name =req.body.name;
  //  const email =req.body.email;
  //  const password =req.body.password;

  const
  {
    gender,
    firstname,
    lastname,
    email,
    password,
    phone,
    birth
  } = req.body;

  db.query('SELECT email FROM user WHERE email = ?', [email], (error, results) =>
  {
    if (error)
    {
      console.log(error);
    }

    if (results.length > 0)
    {
      return res.render('register');
    }

    db.query('INSERT INTO user SET ?',
    {
      gender: gender,
      firstname: firstname,
      lastname: lastname,
      email: email,
      password: password,
      phone: phone,
      birth: birth
    }, (error, results) =>
    {
      if (error)
      {
        console.log(error);
      }
      else
      {
        console.log(results);
        return res.render('index');
      }
    });

  });
}


//MyPage
exports.mypage = async (req, res) =>
{
  console.log(req.body);
  console.log(req.cookies);

  const
  {
    gender,
    firstname,
    lastname,
    email,
    password,
    phone,
    birth
  } = req.body;

  // l- : logined
  const lemail = req.cookies.user.email;
  const lno = req.cookies.user.no;

  if (!(req.cookies))
  {
    console.log("로그인이 되지 아니함");
    res.status(401).render('index');
  }

  // 저장할 내용 = DB비교
  db.query('SELECT email FROM user WHERE email = ?', [email], (error, results) =>
  {
    if (error)
    {
      console.log(error);
    }
    console.log(results);

    if (results.length > 1)
    {
      console.log("두개 이상의 이메일은 존재하면 안됨");
      return res.render('mypage');
    }
    else if ((results.length == 1) && (email != lemail))
    {
      console.log("내 이메일 주소가 아님");
      return res.render('mypage');
    }
  });

  // 로그인 내역 = DB비교
  db.query('SELECT email FROM user WHERE email = ?', [lemail], (error, results) =>
  {
    if (error)
    {
      console.log(error);
    }
    console.log(results);
    if (results.length <= 0)
    {
      console.log("존재하지 않은 로그인(오류발생)");
      res.status(401).render('index');
    }
  });

  //DB 업데이트
  db.query('UPDATE user SET gender=?, firstname=?, lastname=?, email=?, password=?, phone=?, birth=? WHERE no=?',
    [gender, firstname, lastname, email, password, phone, birth, lno],
    (error, results) =>
    {
      if (error)
      {
        console.log(error);
        res.status(500).send('Internal Server Error');
      }
      else
      {
        //DB가 업데이트 되면 쿠키 업데이트
        const cookieOptions = {
          expires: new Date(
            Date.now() + process.env.JWT_COOKIE_EXPIRES * 24 * 60 * 60 * 1000
          )
        }
        res.cookie('user',
        {
          no: req.cookies.user.no,
          gender: gender,
          firstname: firstname,
          lastname: lastname,
          email: email,
          password: password,
          phone: phone,
          birth: birth,
          height: req.cookies.user.height,
          weight: req.cookies.user.weight
        }, cookieOptions);

        res.status(200).redirect("/main");
      }
    });
}


exports.bmi = async (req, res) =>
{
  console.log(req.body);
  console.log(req.cookies);
  const
  {
    height,
    weight
  } = req.body;
  const lemail = req.cookies.user.email;

  db.query('SELECT email FROM user WHERE email = ?', [lemail], (error, results) =>
  {
    console.log(results);

    db.query('UPDATE user SET height=?, weight=? WHERE email=?', [height, weight, lemail], (error, results) =>
    {
      if (error)
      {
        console.log(error);
        res.status(500).send('Internal Server Error');
      }
      else
      {
        const bmi = weight / Math.pow((height / 100), 2);
        answer = null;

        if (height != 0 && weight != 0)
        {
          var comment;
          if (bmi < 18.5)
            comment = "저체중";
          else if (bmi >= 18.5 && bmi <= 25)
            comment = "정상체중";
          else if (bmi >= 25 && bmi <= 30)
            comment = "과체중";
          else
            comment = "비만";

          answer = '당신의 bmi는 <b>' + bmi.toFixed(2) + '</b>입니다.<br/>' +
            '당신의 비만도 결과는 <b>' + comment + '</b>입니다.';
        }

        res.render('mypage',
        {
          answer: answer
        });
      }
    });
  });
}

//evaluation
exports.evaluation = async (req, res) =>
{
  console.log(req.body);

  const
  {
    name,
    message
  } = req.body;

  db.query('INSERT INTO evaluation SET ?',
  {
    name: name,
    message: message
  }, (error, results) =>
  {
    if (error)
    {
      console.log(error);
    }
    else
    {
      console.log(results);
      return res.render('evaluation');
    }
  });
}


//customer
exports.customer = async (req, res) =>
{
  console.log(req.body);

  const
  {
    name,
    email,
    subject,
    message
  } = req.body;

  db.query('INSERT INTO customerservices SET ?',
  {
    name: name,
    email: email,
    subject: subject,
    message: message
  }, (error, results) =>
  {
    if (error)
    {
      console.log(error);
    }
    else
    {
      console.log(results);
      return res.render('customer');
    }
  });
}

//exercise
exports.excercise = async (req, res) =>
{}
