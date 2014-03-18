# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
   Morris.Bar
    element: 'geral'
    data: $('#geral').data('records')
    xkey: 'x'
    ykeys: ['y']
    labels: ['Presenças']
      
$(document).ready(ready)
$(document).on('page:load', ready)