# behaviors and hooks related to the matching controller
# all yr logic are automatically belong to application.js
# http://jashkenas.github.com/coffee-script/

hazToggz = false

client.subscribe '/p', (payload)->
  time = moment(payload.created_at).format('D/M/YYYY H:mm:ss')
  # You probably want to think seriously about XSS here:
  if hazToggz 
    $('#chat').append("<li class='down-left'><span class='time' style='display: none;'>#{time}</span> #{payload.message}</li>")
    $("#libload").attr('value',"#{payload.message}")
    jsfxgui.paramsFromFieldAndPlay()
  else
    $("#libload").attr('value', "#{payload.message}")
    $('#chat').append("<li class='down-left'><span class='time' style='display: none;'>#{time}</span> #{payload.message}</li>")
    jsfxgui.paramsFromFieldAndPlay()

$(document).ready ->
  libload = $('#libload')
  sendField = $('#sendField')
  sendField.click ->
    sendField.attr('disabled', 'disabled')
    sendField.text('posting...')
    publication = client.publish '/p',
      message: libload.attr('value')
      created_at: new Date()
    publication.callback ->
      sendField.removeAttr('disabled')
      sendField.text('post')
    publication.errback ->
      sendField.removeAttr('disabled')
      sendField.text('try again?')


# inspector help.
window.client = client
