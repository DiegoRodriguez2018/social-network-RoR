App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    unless data.content.blank?
      $('#chat-messages').append '<tr>' +
      '<td>' + data.user + ":" + '</td>' +
      '<td  class="message-content">' + data.content + '</td>' + '</tr>'

$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()

# There are three steps:
# Click to submit the form. with jquery we can do       $('input').click()
# Clear the box after submission.
# Ignore the Enter character.

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    # Check if is enter
    if event.keyCode is 13
      $('input').click()
      event.target.value = ""
      event.preventDefault()

scroll_bottom = () ->
  $('#chat-messages').scrollTop($('#chat-messages')[0].scrollHeight)
