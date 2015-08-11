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
#= require highlightjs

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
  # $("select").material_select(); # Doesn't work

  flashes = $('.flash').html()
  $('.flash .alert').each (index, flash) ->
    Materialize.toast(flash.innerHTML, 1500)
  $('.flash').html('')
  # if flashes.trim() != ''
  #   console.log(flashes)
  #   flashes = flashes.split('\n')
  #   flashes.forEach (flash, i) ->
  #     Materialize.toast(flash, 10000)

$(document).ready(ready)
$(document).on('page:load', ready)
