# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $.ajax '/dashboards',
            type: 'GET'
            dataType: 'script'
            error: (jqXHR, textStatus, errorThrown) ->
              console.log "AJAX Error: #{textStatus}: #{errorThrown}"

  