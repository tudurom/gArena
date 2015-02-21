user_show = (function() {
  $('#show-button').on('click', function(e){
    $('#hidden_form').slideDown(350);
    $('#hidden_form').css('display', 'block');
  });
});

$(document).ready(user_show);
$(document).on('page:load', user_show);
