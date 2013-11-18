# behaviors and hooks related to the matching controller
# all yr logic are automatically belong to application.js
# http://jashkenas.github.com/coffee-script/

hazToggz = false

client.subscribe '/p', (payload)->
  time = moment(payload.created_at).format('D/M/YYYY H:mm:ss')
  # You probably want to think seriously about XSS here:
  if hazToggz 
    $('#chat').append("<li class='down-left'><span class='time'>#{time}</span> #{payload.message}</li>")
    $("#libload").attr('value',"#{payload.message}")
  else
    $("#libload").attr('value', "#{payload.message}")  

$(document).ready ->
  libload = $('#libload')
  loadField = $('#loadField')
  loadField.click ->
    loadField.attr('disabled', 'disabled')
    loadField.text('posting...')
    publication = client.publish '/p',
      message: libload.attr('value')
      created_at: new Date()
    publication.callback ->
      loadField.removeAttr('disabled')
      loadField.text('post')
      console.log "got"+publication.message
      libload.attr('value', publication.message)
      jsfxgui.play()
    publication.errback ->
      loadField.removeAttr('disabled')
      loadField.text('try again?')


# inspector help.
window.client = client
