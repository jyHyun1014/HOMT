function CountdownTimer(seconds, tickRate) {
  this.seconds = seconds || (25 * 60);
  this.tickRate = tickRate || 500; // Milliseconds
  this.tickFunctions = [];
  this.isRunning = false; // 실행 중인가
  this.remaining = this.seconds; // 남은 시간

  // 1틱에 한번씩 숫자 감소
  this.start = function() {
    if (this.isRunning) {
      return;
    }
    this.isRunning = true;

    // 타이머가 시작 시점과 관련된 변수 설정
    var startTime = Date.now(),
      thisTimer = this;

    // 초가 끝나거나 멈출 때까지 틱
    (function tick() {
      secondsSinceStart = ((Date.now() - startTime) / 1000) | 0;
      var secondsRemaining = thisTimer.remaining - secondsSinceStart;

      // 유저가 타이머를 멈추면 확인
      if (thisTimer.isRunning === false) {
        thisTimer.remaining = secondsRemaining;
      } else {
        if (secondsRemaining > 0) {
          // 다른 틱을 밀리초마다 실행
          setTimeout(tick, thisTimer.tickRate);
        } else {
          // 타이머 멈춤
          thisTimer.remaining = 0;
          thisTimer.isRunning = false;

          // 사용자에게 타이머 알림
          playAlarm();
        }

        var timeRemaining = parseSeconds(secondsRemaining);

        // 이 Timer를 인수로 사용하여 목록의 각 chickFunction 실행
        thisTimer.tickFunctions.forEach(
          function(tickFunction) {
            tickFunction.call(this,
              timeRemaining.minutes,
              timeRemaining.seconds);
          },
          thisTimer);
      }
    }());
  };

  // 타이머 일시정지
  this.pause = function() {
    this.isRunning = false;
  };

  // 타이머 일시정지 후 값 리셋
  this.reset = function(seconds) {
    this.isRunning = false;
    this.seconds = seconds
    this.remaining = seconds
  };

  //타이머의 tickFunction에 함수추가
  this.onTick = function(tickFunction) {
    if (typeof tickFunction === 'function') {
      this.tickFunctions.push(tickFunction);
    }
  };
}

// 분, 초 반환
function parseSeconds(seconds) {
  return {
    'minutes': (seconds / 60) | 0,
    'seconds': (seconds % 60) | 0
  }
}

// 알람
function playAlarm() {
  var alarmAudio = "alram.mp3"; // 파일 필요
  alarmAudio.play();
}

// 실행 시 바로 로드될 함수
window.onload = function() {
  var timerDisplay = document.getElementById('timer'),
    customTimeInput = document.getElementById('ipt_custom'),
    timer = new CountdownTimer(),
    timeObj = parseSeconds(25 * 60);

  //메인 시계 디스플레이의 시간을 설정
  function setTimeOnAllDisplays(minutes, seconds) {
    if (minutes >= 60) {
      hours = Math.floor(minutes / 60);
      minutes = minutes % 60;
      clockHours = hours + ':';
    } else {
      clockHours = '';
    }

    clockMinutes = minutes < 10 ? '0' + minutes : minutes;
    clockMinutes += ':';
    clockSeconds = seconds < 10 ? '0' + seconds : seconds;

    timerDisplay.textContent = clockHours + clockMinutes + clockSeconds;
  }

  // 타이머 리셋
  function resetMainTimer(seconds) {
    timer.pause();
    timer = new CountdownTimer(seconds);
    timer.onTick(setTimeOnAllDisplays);
  }

  // 기본 페이지 타이머 표시 설정
  setTimeOnAllDisplays(timeObj.minutes, timeObj.seconds);

  timer.onTick(setTimeOnAllDisplays);

  // 시작, 일시 중지 등의 버튼을 위한 리스너 추가
  document.getElementById('btn_start').addEventListener(
    'click',
    function() {
      timer.start();
    });

  document.getElementById('btn_pause').addEventListener(
    'click',
    function() {
      timer.pause();
    });

  document.getElementById('btn_reset').addEventListener(
    'click',
    function() {
      resetMainTimer(timer.seconds);
      timer.start();
    });

  document.getElementById('btn_custom').addEventListener(
    'click',
    function() {
      customUnits = document.getElementById('custom_units').value
      resetMainTimer(customTimeInput.value * 60);
      timer.start();
    });
};
