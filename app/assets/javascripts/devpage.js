$(document).ready(function() {

  var index = 'http://localhost:3000/'
  $('.timerendbutton').hide()

  $('.timerstartbutton').on('click', function(ev){
    ev.preventDefault()
    stopwatch("Start")
    var projectTitle = $(this).parents('.developer-project').find('.projecttitle').text();
    var projectid = $(this).parents('.developer-project').find('.projectid').text().replace(/\s/g, '')
    $('#timer-title').html("<h4 class=\"text-info\">" + projectTitle + "</h4>");
    $('.timerstartbutton').hide();
    $('#endtimer-'+ projectid).show()

  })

  $('.timerendbutton').on('click', function(ev){
    ev.preventDefault();
    stopwatch("Stop ");
    $('#theButton').val("Start ");
    var timerString = $('.form-control').val().split(':');
    var timerActualValue = ((+timerString[0]) * 60 * 60 + (+timerString[1]) * 60 + (+timerString[2]));
    var userid = $(this).parents('.developer-project').find('.userid').text().replace(/\s/g, '');
    var projectid = $(this).parents('.developer-project').find('.projectid').text().replace(/\s/g, '');
    $.post({
        url: index + "/projects/"+ projectid + "/timers",
        data: {user_id: userid, project_id: projectid, value: timerActualValue},
        success: function(data){
          location.reload()
        }
    })


  })

})
