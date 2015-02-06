#= require polymer/webcomponents
#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require flat-ui
#= require turbolinks
#= require jquery.tablesorter
#= require jquery-validation
#= require jquery.avgrund
#= require pagedown_bootstrap
#= require pagedown_init

# $(function() {
#   $('.back_link').click(function() {
#     history.back();
#
#     return false;
#   });
# });

$ ->
  $('.back_link').click ->
    history.back()

    return false
