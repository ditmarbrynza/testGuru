document.addEventListener('turbolinks:load', function() {

  var timerSelector = document.querySelector('.timer')

  if (timerSelector) {
    timer = timerSelector.dataset.timer
    let timerId = setInterval(() => startTime(), 1000)
    
    function startTime() {
      if (timer > 60) {
        timerSelector.innerHTML = Math.round(timer/60)
      } else
      if (timer < 60 && timer > 0) {
        timerSelector.innerHTML = Math.round(timer)
      } else
      if (timer <= 0) {
        window.location.href = window.location.href + '/result'
        clearInterval(timerId)
        return
      }
      timer --
    }

  }
})
