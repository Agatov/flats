$ ->

  $('.order-button').on 'click', ->

    form = $(@).parents('.form')

    username = form.find('input[name=username]')
    phone = form.find('input[name=phone]')

    shake_fields = []

    if username.val() < 2
      shake_fields.push username

    if phone.val() < 10
      shake_fields.push phone

    if shake_fields.length > 0
      shake_field(field) for field in shake_fields
      return false

    $.post(
      '/orders.json',
    {
      'order[username]': username.val(),
      'order[phone]': phone.val()
    },
    (data) =>

    )

    $('input').val('')

    show_thank_you()
    reachGoal 'new_order'


  $('.add-message').on 'click', ->
    $(@).hide()
    $('input.long').show()

  $('#hide-thank-you').on 'click', ->
    close_thank_you()

  $('.rent-button').on 'click', ->
    show_modal()

    $('.modal-overlay').on 'click', ->
      $('.modal-dialog').hide()
      $('.modal-overlay').hide()


window.show_modal = ->
  $('.modal-overlay').show()
  $('.modal-dialog').show()

window.show_thank_you = ->

  if $('.modal-dialog').css('display') == 'block'
    $('.modal-dialog').hide()
  else
    $(".modal-overlay").show()

  $('.modal-thank-you').show()

  $('.modal-overlay').on 'click', ->
    close_thank_you()




window.close_thank_you = ->
  $(".modal-thank-you").hide()
  $(".modal-overlay").hide()



window.shake_field = (field) ->
  shake(field, i) for i in [1..10]


window.shake = (field, i) ->

  if i%2
    field.animate({height: '-=15'}, 100)
  else
    field.animate({height: '+=15'}, 100)


window.reachGoal = (goal) ->
  yaCounter26620161.reachGoal goal

