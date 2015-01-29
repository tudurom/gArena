$(document).ready(function(){
  $('#show-button').on('click', function(e){
    $('#task-form').slideDown(350);
    $('#task-form').css('display', 'block');
  });
});

$(document).ready(function(){
  $("#usr-table").tablesorter();
});
