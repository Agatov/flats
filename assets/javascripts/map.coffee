$ ->

  placemarks = {
    'schools': [
      {name: 'СОШ №95', address: 'улица Кореновская, дом 33', coordinates: [45.10105080, 38.97605850]},
      {name: 'СОШ №96', address: 'улица Кореновская, дом 35', coordinates: [45.10005830, 38.97579850]},
      {name: 'СОШ №98', address: 'улица Дзержинского, дом 100 корпус 1', coordinates: [45.09846130, 38.98617350]},
      {name: 'СОШ №65', address: 'улица Дорожная, дом 1 корпус 1', coordinates: [45.12499280, 38.98327250]},
      {name: 'детский сад № 108 «Аистенок»', address: 'улица Дзержинского 219', coordinates: [45.10061830, 38.97774750]},
      {name: 'детский сад № 107 «Русалочка»', address: 'улица Дзержинского 207', coordinates: [45.09933330, 38.97733450]},
      {name: 'детский сад № 100 «Центр развития ребенка» ', address: 'улица Дзержинского 100/2', coordinates: [45.09846130, 38.98617350]},
      {name: 'детская школа искусств № 1', address: 'улица Кореновская 33', coordinates: [45.10105080, 38.97605850]},
      {name: 'детская школа искусств № 14', address: 'улица Дзержинского 213', coordinates: [45.09961930, 38.97962500]},
      {name: 'библиотека № 31', address: 'улица Дзержинского 213', coordinates: [45.09961930, 38.97962500]},
    ],
    'sport': [
      
      {name: 'спортивный комплекс «Баскет-Холл»', address: 'улица Пригородная 24', coordinates: [45.11740530, 38.98130450]},
      {name: 'детская теннисная академия', address: 'улица Пригородная 24 корпус 1', coordinates: [45.11734230, 38.97761250]},
      {name: 'фитнес-центр GOLD’S GYM', address: 'улица Покрышкина 25 корпус 1', coordinates: [45.10285780, 38.97967850]},
      {name: 'плавательный бассейн ЦСКА', address: 'улица Кореновская 31', coordinates: [45.10053580, 38.97505250]},
      {name: 'футбольная академия ФК “Краснодар”', address: 'неизвестно', coordinates: [45.09954628, 38.97193863]},
    ],
    'health': [
      {name: 'городская поликлиника № 13', address: 'улица Силантьева  76 корпус 1', coordinates: [45.11645130, 38.99742950]},
      {name: 'аптека «Арника»', address: 'улица Покрышкина 30', coordinates: [45.10183980, 38.98079250]},
      {name: 'аптека Доктор Пилюлькин', address: 'улица Покрышкина 15 корпус 1', coordinates: [45.10463880, 38.97003950]},
      {name: 'аптека Аптечный Мир', address: 'улица Кореновская 15в', coordinates: [45.09908530, 38.97177350]},
      {name: 'аптека (Средняя 47)', address: 'улица Средняя 47', coordinates: [45.10877430, 38.93488850]},
    ],
    'dosug': [
      {name: 'ТРЦ «Красная Площадь»', address: 'улица Дзержинского 100', coordinates: [45.10291480, 38.98405350]},
      {name: 'развлекательный комплекс «Космик»', address: 'улица Дзержинского 100', coordinates: [45.10291480, 38.98405350]},
      {name: 'развлекательный комплекс «Острова»', address: 'улица Дзержинского 100', coordinates: [45.10291480, 38.98405350]},
      {name: 'ресторан "Мюнгаузен"', address: 'улица Баварская 6', coordinates: [45.12157780, 38.92654350]},
      {name: 'ресторан «Москва»', address: 'улица Покрышкина 27', coordinates: [45.10267330, 38.98064900]},
      {name: 'продуктовый магазин (Средняя 42)', address: 'улица Средняя 42', coordinates: [45.10979830, 38.93480800]},
      {name: 'продуктовый магазин (Троицкая 147а)', address: 'улица Торицкая 147а', coordinates: [45.10928330, 38.93607450]},
      {name: 'гипермаркет "Магнит"', address: 'улица Дзержинского 100', coordinates: [45.10291480, 38.98405350]},
      {name: 'гипермаркет "Магнит" (строящийся)', address: '', coordinates: [45.10712561, 38.94843412]},
      {name: 'гипермаркет "OBI" (проектируемый)', address: '', coordinates: [45.10688248, 38.94937826]},
    ],
    'mir': [
      {name: 'Жилой комплекс «МИР»', coordinates: [45.10794615, 38.94890619]}
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

    window.mir_placemarks_collection = new ymaps.GeoObjectCollection({}, {preset: 'islands#blackStretchyIcon'})

    window.schools_placemarks_collection = new ymaps.GeoObjectCollection({}, {preset: 'islands#icon', iconColor: '#4990E2'})

    window.sport_placemarks_collection = new ymaps.GeoObjectCollection({}, {preset: 'islands#icon', iconColor: '#7ED320'})

    window.dosug_placemarks_collection = new ymaps.GeoObjectCollection({}, {preset: 'islands#icon', iconColor: '#AC4D86'})

    window.health_placemarks_collection = new ymaps.GeoObjectCollection({}, {preset: 'islands#icon', iconColor: '#F54438'})


    add_mir_placemark(mir_placemarks_collection, placemarks['mir'][0])
    add_placemark(schools_placemarks_collection, placemark, 'schools') for placemark in placemarks['schools']
    add_placemark(sport_placemarks_collection, placemark, 'sport') for placemark in placemarks['sport']
    add_placemark(health_placemarks_collection, placemark, 'health') for placemark in placemarks['health']
    add_placemark(dosug_placemarks_collection, placemark, 'dosug') for placemark in placemarks['dosug']


    map2.geoObjects.add mir_placemarks_collection   
    map2.geoObjects.add schools_placemarks_collection
    map2.geoObjects.add sport_placemarks_collection
    map2.geoObjects.add health_placemarks_collection
    map2.geoObjects.add dosug_placemarks_collection

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



window.add_placemark = (collection, data, category = '') ->

  placemark = new ymaps.Placemark(
    data.coordinates,
  {
    balloonContent: data.name
  }
  )

  if category
    li = document.createElement("li")
    $(li).text(data.name)

    $(li).on 'click', ->
      $('body').animate({scrollTop: $('#map2').offset().top}, 200)
      placemark.balloon.open()

    $("ul.map-column.#{category}").append li

  collection.add(placemark)

window.add_mir_placemark = (collection, data) ->

  placemark = new ymaps.Placemark(
    data.coordinates,
    {
      balloonContent: data.name,
      iconContent: 'Жилой комплекс Мир'
    }
  )


  collection.add(placemark)