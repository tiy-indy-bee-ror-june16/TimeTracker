$(document).ready(function() {

  var index = 'http://localhost:3000/'

  $('.timerstartbutton').on('click', function(ev){
    ev.preventDefault()
    stopwatch("Start")
    console.log($(this))
    console.log($('#timer-title').text())

  })

  $('.timerendbutton').on('click', function(ev){
    ev.preventDefault();
    stopwatch("Stop ");
    $('#theButton').val("Start ");
    var timerstring = $('.form-control').val().split(':');
    var timerActualValue = ((+timerstring[0]) * 60 * 60 + (+timerstring[1]) * 60 + (+timerstring[2]))/3600;
    var userid = $(this).parents('.developer-project').find('.userid').text();
    var projectid = $(this).parents('.developer-project').find('.projectid').text();
    $.post({
        url: index + "/projects/"+ projectid + "/timers",
        data: {user_id: userid, project_id: projectid, value: timerActualValue},
        success: function(data){
          location.reload()
        }
    })


  })

})
