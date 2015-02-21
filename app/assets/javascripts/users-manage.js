users_manage = (function() {
  $('#show-button').on('click', function(e){
    $('#task-form').slideDown(350);
    $('#task-form').css('display', 'block');
  });
  $("#usr-table").tablesorter();
});

$(document).ready(users_manage);
$(document).ready(user_manage);
$(document).on('page:load', user_manage);
