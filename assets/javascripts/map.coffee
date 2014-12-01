$ ->

  placemarks = {
    'schools': [
      {name: 'Средняя школа №95', address: 'улица Кореновская, дом 33', coordinates: [45.10105080, 38.97605850]},
      {name: 'Средняя школа №96', address: 'улица Кореновская, дом 35', coordinates: [45.10005830, 38.97579850]},
      {name: 'Средняя школа №98', address: 'улица Дзержинского, дом 100 корпус 1', coordinates: [45.09846130, 38.98617350]},
      {name: 'Средняя школа №65', address: 'улица Дорожная, дом 1 корпус 1', coordinates: [45.12499280, 38.98327250]},
    ],
    'minischools': [
      {name: 'Детский сад № 108 «Аистенок»', address: 'улица Дзержинского 219', coordinates: [45.10061830, 38.97774750]},
      {name: 'Детский сад № 107 «Русалочка»', address: 'улица Дзержинского 207', coordinates: [45.09933330, 38.97733450]},
      {name: 'Детский сад № 100 «Центр развития ребенка» ', address: 'улица Дзержинского 100/2', coordinates: [45.09846130, 38.98617350]}
    ],
    'sections': [
      {name: 'Детская школа искусств № 1', address: 'улица Кореновская 33', coordinates: [45.10105080, 38.97605850]},
      {name: 'Детская школа искусств № 14', address: 'улица Дзержинского 213', coordinates: [45.09961930, 38.97962500]},
      {name: 'Спортивный комплекс «Баскет-Холл»', address: 'улица Пригородная 24', coordinates: [45.11740530, 38.98130450]},
      {name: 'Детская теннисная академия', address: 'улица Пригородная 24 корпус 1', coordinates: [45.11734230, 38.97761250]},
    ],
    'shops': [
      {name: 'ТРЦ «Красная Площадь»', address: 'улица Дзержинского 100', coordinates: [45.10291480, 38.98405350]},
      {name: 'Гипермаркет "Магнит"', address: 'улица Дзержинского 100', coordinates: [45.10291480, 38.98405350]},
      {name: 'Доктор Пилюлькин, аптека', address: 'улица Покрышкина 15 корпус 1', coordinates: [45.10463880, 38.97003950]},
      {name: 'Аптечный Мир, аптека', address: 'улица Кореновская 15в', coordinates: [45.09908530, 38.97177350]},
      {name: 'Аптека', address: 'улица Средняя 47', coordinates: [45.10877430, 38.93488850]},
      {name: 'Продуктовый магазин', address: 'улица Средняя 42', coordinates: [45.10979830, 38.93480800]},
      {name: 'Продуктовый магазин', address: 'улица Торицкая 147а', coordinates: [45.10928330, 38.93607450]},
    ],
    'dosug': [
      {name: 'ТРЦ «Красная Площадь»', address: 'улица Дзержинского 100', coordinates: [45.10291480, 38.98405350]},
      {name: 'Ресторан "Мюнгаузен"', address: 'улица Баварская 6', coordinates: [45.12157780, 38.92654350]},
      {name: 'развлекательный комплекс «Москва» с пивоварней', address: 'улица Покрышкина 27', coordinates: [45.10267330, 38.98064900]},
      {name: 'Фитнес-центр GOLD’S GYM', address: 'улица Покрышкина 25 корпус 1', coordinates: [45.10285780, 38.97967850]},
      {name: 'городская поликлиника № 13', address: 'улица Силантьева  76 корпус 1', coordinates: [45.11645130, 38.99742950]},
    ]
  }

  waitForMap ->
    window.map2 = new ymaps.Map($("#map2")[0], {center: [45.10969251, 38.97275151], zoom: 14})

    ymaps.option.presetStorage.add('my#icon', {
      iconImageHref: '/images/blue_marker.png',
      iconImageSize: [30, 50],
      iconImageOffset: [0, 0] 
    })

    map2.behaviors.disable('scrollZoom')


    map2.controls.remove('typeSelector')
    map2.controls.remove('searchControl')
    map2.controls.remove('trafficControl')
    map2.controls.remove('fullscreenControl')
    map2.controls.remove('geolocationControl')

    window.placemarks_collection = new ymaps.GeoObjectCollection({}, {preset: 'my#icon'})

    add_placemark(placemarks_collection, placemark) for placemark in placemarks['schools'] 
    map2.geoObjects.add placemarks_collection   

    ###
    placemark = new ymaps.Placemark(
      [45.10105080, 38.97605850],
    {
      balloonContent: 'г. Краснодар, ул. Дальняя 39/3'
    }
    )

    map2.geoObjects.add(placemark)
    ###

  $('.map-tabs .tab').on 'click', ->


    $('.map-tabs .tab').removeClass 'active'
    $(@).addClass 'active'

    placemarks_collection.removeAll()
    add_placemark(window.placemarks_collection, placemark) for placemark in placemarks[$(@).attr('rel')]



window.add_placemark = (collection, data) ->

  placemark = new ymaps.Placemark(
    data.coordinates,
  {
    balloonContent: data.name
  }
  )

  collection.add(placemark)