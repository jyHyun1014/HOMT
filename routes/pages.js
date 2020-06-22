const express = require('express');

const router = express.Router();

// req: request
// res: response to frontend
router.get("/", (req, res) =>
{
  res.render("index");
})

// 초기화면을 로그인 화면으로 처리하고 나머지 페이지의 상단바를 로그아웃/마이페이지로 처리
router.get("/login", (req, res) =>
{
  res.render("index");
})

router.get("/register", (req, res) =>
{
  res.render("register");
})

// 메인화면을 지목하면 메인화면으로 이동
router.get("/main", (req, res) =>
{
  res.render("main");
})

//로그아웃 과정입니다
router.get("/logout", (req, res) =>
{
  try
  {
    // 삭제
    res.clearCookie('user');
    res.render("index");
  }

  catch (error)
  {
    console.log(error);
  }
})

router.get("/mypage", (req, res) =>
{
  res.render("mypage",
  {
    answer: null
  });
})

router.get("/aboutus", (req, res) =>
{
  res.render("aboutus");
})

router.get("/workout_bodypart", (req, res) =>
{
  res.render("workout_bodypart");
})

router.get("/workout_difficulty", (req, res) =>
{
  res.render("workout_difficulty");
})

router.get("/recommandation", (req, res) =>
{
  res.render("recommandation");
})

router.get("/customizing", (req, res) =>
{
  res.render("customizing");
})

router.get("/timer", (req, res) =>
{
  res.render("timer");
})

router.get("/board", (req, res) =>
{
  res.render("board");
})

router.get("/ranking", (req, res) =>
{
  res.render("ranking");
})

router.get("/news", (req, res) =>
{
  res.render("news");
})

router.get("/guide", (req, res) =>
{
  res.render("guide");
})

router.get("/notice", (req, res) =>
{
  res.render("notice");
})

router.get("/customer", (req, res) =>
{
  res.render("customer");
})

router.get("/evaluation", (req, res) =>
{
  res.render("evaluation");
})

router.get("/news2", (req, res) =>
{
  res.render("news2");
})

router.get("/news3", (req, res) =>
{
  res.render("news3");
})

router.get("/news4", (req, res) =>
{
  res.render("news4");
})

router.get("/calculator", (req, res) =>
{
  res.render("calculator");
})

router.get("/youtube", (req, res) =>
{
  res.render("youtube");
})

router.get("/magazine", (req, res) =>
{
  res.render("magazine");
})

//////////////////////////여기서 부터는 운동 상세보기 페이지
router.get("/Supermans", (req, res) =>
{
  res.render("workout_detail/Supermans");
})

router.get("/Push-up", (req, res) =>
{
  res.render("workout_detail/Push-up");
})

router.get("/Contralateral%20Limb%20Raises", (req, res) =>
{
  res.render("workout_detail/ContralateralLimbRaises");
})

router.get("/Bent%20Knee%20Push-up", (req, res) =>
{
  res.render("workout_detail/BentKneePush-up");
})

router.get("/Downward-facing%20Dog", (req, res) =>
{
  res.render("workout_detail/Downward-facingDog");
})

router.get("/Crunch", (req, res) =>
{
  res.render("workout_detail/Crunch");
})

router.get("/Push-up%20with%20Single-leg%20Raise", (req, res) =>
{
  res.render("workout_detail/Push-upwithSingle-legRaise");
})

router.get("/Front%20Plank", (req, res) =>
{
  res.render("workout_detail/FrontPlank");
})

router.get("/Side%20Plank%20with%20Bent%20Knee", (req, res) =>
{
  res.render("workout_detail/SidePlankwithBentKnee");
})


router.get("/Supine%20Reverse%20Crunch", (req, res) =>
{
  res.render("workout_detail/SupineReverseCrunch");
})


router.get("/Cobra", (req, res) =>
{
  res.render("workout_detail/Cobra");
})


router.get("/Squat%20Jumps", (req, res) =>
{
  res.render("workout_detail/SquatJumps");
})


router.get("/Forward%20Lunge", (req, res) =>
{
  res.render("workout_detail/ForwardLunge");
})


router.get("/Forward%20Lunge%20with%20Arm%20Drivers", (req, res) =>
{
  res.render("workout_detail/ForwardLungewithArmDrivers");
})


router.get("/Glute%20Activation%20Lunges", (req, res) =>
{
  res.render("workout_detail/GluteActivationLunges");
})


router.get("/Glute%20Bridge", (req, res) =>
{
  res.render("workout_detail/GluteBridge");
})


router.get("/Hip%20Rotations", (req, res) =>
{
  res.render("workout_detail/HipRotations");
})


router.get("/Side%20Lunge", (req, res) =>
{
  res.render("workout_detail/SideLunge");
})


router.get("/Side%20Lying%20Hip%20Abduction", (req, res) =>
{
  res.render("workout_detail/SideLyingHipAbduction");
})


router.get("/Side%20Lying%20Hip%20Adduction", (req, res) =>
{
  res.render("workout_detail/SideLyingHipAdduction");
})


router.get("/Side%20Plank", (req, res) =>
{
  res.render("workout_detail/SidePlank");
})


router.get("/Side%20Plank%20with%20Straight%20Leg", (req, res) =>
{
  res.render("workout_detail/SidePlankwithStraightLeg");
})


router.get("/Single%20Leg%20Stand", (req, res) =>
{
  res.render("workout_detail/SingleLegStand");
})


router.get("/Standing%20Calf%20Raises", (req, res) =>
{
  res.render("workout_detail/StandingCalfRaises");
})


router.get("/Supine%20Pelvic%20Tilts", (req, res) =>
{
  res.render("workout_detail/SupinePelvicTilts");
})



module.exports = router;
