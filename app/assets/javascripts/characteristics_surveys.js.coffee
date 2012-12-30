# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ()->
  $("form.new_characteristics_survey").on "ajax:success", (event, data, status, xhr) ->
    $('#addChar').modal('hide')
    $('table tbody').append('<tr><td>' + data.title + '</td><td>' + data.content + '</td></tr>')

