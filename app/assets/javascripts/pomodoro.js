$(function() {
  var status = 'wait';
  var target;
  var timerId;
  var Notification = window.Notification || window.mozNotification || window.webkitNotification;
  Notification.requestPermission();

  $('#pomodoro .start').click(function() {
    startPomodoro();
    $('.start').hide();
    $('.stop').show();
  });

  $('#pomodoro .stop').click(function() {
    clearTimeout(timerId);
    $('.stop').hide();
    $('.start').show();
    $("#pomodoro-timer").text('25:00');
    changeNavColor('blue darken-2');
  });

  function countDown() {
    var diff = target - new Date();
    if (diff <= 0) {
      timeup();
      return;
    }

    $("#pomodoro-timer").text(zeroPadding(diff / 60000) + ':' + zeroPadding(diff % 60000 / 1000));
    timerId = setTimeout(countDown, 1000);
  }

  function timeup() {
    if (status == 'pomodoro') {
      startBreak();
    } else {
      startPomodoro();
    }
  }

  function showNotification(text) {
    var instance = new Notification('Zone', { body: text });
  }

  function setTimer(minute) {
    var now = new Date();
    target = now.setMinutes(now.getMinutes() + minute);
    // target = now.setSeconds(now.getSeconds() + 5);
    countDown();
  }

  function zeroPadding(x) {
    return ('0' + String(Math.floor(x))).slice(-2);
  }

  function startPomodoro() {
    status = 'pomodoro';
    showNotification('Start pomodoro');
    changeNavColor('pink darken-1');
    setTimer(25);
  }

  function startBreak() {
    status = 'break';
    showNotification('Start break');
    changeNavColor('green darken-1');
    setTimer(5);
  }

  function changeNavColor(color) {
    $nav = $('nav');
    $nav.removeClass();
    $nav.addClass(color);
  }
});
