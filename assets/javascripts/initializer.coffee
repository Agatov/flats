$ ->

  $('.prices-tabs .tab').on 'click', ->
    $('.flat-plan').hide()
    $(".flat-plan[anchor=#{$(@).attr('rel')}]").show()

    $('.prices-tabs .tab').removeClass 'active'
    $(@).addClass 'active'

  waitForMap ->

    #http://geocode-maps.yandex.ru/1.x/?geocode=OLOLOLO
    map = new ymaps.Map($("#map")[0], {center: [45.060930, 38.964569], zoom: 16})
    add_placemark_on_contacts_map(map)


window.add_placemark_on_contacts_map = (map) ->

  placemark = new ymaps.Placemark(
    [45.060930, 38.964569],
  {
    balloonContent: 'г. Краснодар, ул. Дальняя 39/3'
  }
  )

  map.geoObjects.add(placemark)
#  placemark.balloon.open()

window.add_placemark = (map, shop) ->

  if shop == undefined
    return false

  unless $(shop).attr('lat')
    return false

  console.log $(shop).attr('lat')


  placemark = new ymaps.Placemark(
    [parseFloat($(shop).attr('lat')), parseFloat($(shop).attr('lng'))],
  {
    balloonContent: $(shop).attr('name')
  }
  )

  map.geoObjects.add(placemark)
#  placemark.balloon.open()


window.waitForMap = (callback) ->
  if ymaps.Map
    callback(this)
  else
    setTimeout(
      ->
        waitForMap(callback)
      500
    )

