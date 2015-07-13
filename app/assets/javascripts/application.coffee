#= require jquery
#= require jquery_ujs
#= require materialize-sprockets
#= require bootstrap-sprockets
#= require turbolinks
#= require jquery.tablesorter
#= require jquery-validation
#= require jquery.avgrund
#= require markdown.converter
#= require markdown.sanitizer
#= require markdown.editor
#= require bootstrap-tour

# $(function() {
#   $('.back_link').click(function() {
#     history.back();
#
#     return false;
#   });
# });

ready = ->
  $('.back_link').click ->
    history.back()

    return false
  $(".button-collapse").sideNav();
  $("select").material_select();

$(document).ready(ready)
$(document).on('page:load', ready)
