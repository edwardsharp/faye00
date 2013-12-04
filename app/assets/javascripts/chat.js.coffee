# behaviors and hooks related to the matching controller
# all yr logic are automatically belong to application.js
# http://jashkenas.github.com/coffee-script/
hazToggz = false

client.subscribe '/chat', (payload)->
  time = moment(payload.created_at).format('D/M/YYYY H:mm:ss')
  # You probably want to think seriously about XSS here:
  if hazToggz 
    $('#chat').append("<li class='down-left'><span class='time'>#{time}</span> #{payload.message}</li>")
  else
    $('#chat').append("<li><span class='time' style='display: none;'>#{time}</span> #{payload.message}</li>")  

$(document).ready ->
  input = $('input')
  sendChat = $('#sendChat')
  sendChat.click ->
    sendChat.attr('disabled', 'disabled')
    sendChat.text('posting...')
    publication = client.publish '/chat',
      message: input.attr('value')
      created_at: new Date()
    publication.callback ->
   
      sendChat.removeAttr('disabled')
      sendChat.text('post')
    publication.errback ->
      sendChat.removeAttr('disabled')
      sendChat.text('try again?')
  
  
  $('.time').hide()
  $('#chat').on('click', (e) ->
    unless hazToggz
      $(@).toggle(
        -> 
          $('.time').hide()
        ->
          $('.time').show()
      )
    hazToggz = true
  )


# inspector help.
window.client = client
