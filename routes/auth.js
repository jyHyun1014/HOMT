const express = require('express');
const authController = require('../controllers/auth');

const router = express.Router();


// req: request
// res: response to frontend
router.post("/register", authController.register)

router.post("/login", authController.login)

// workout.html
router.post("/excercise", authController.excercise)


// mypage.html 함수
router.post("/mypage", authController.mypage)

router.post("/bmi", authController.bmi)

// evaluation.html
router.post("/evaluation", authController.evaluation)
// customer.html
router.post("/customer", authController.customer)

module.exports = router;
