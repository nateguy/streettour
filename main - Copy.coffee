geocoder = new google.maps.Geocoder()
locality = ""

$ ->

  console.log "Coffee in rails"
#  displayLogin()




  Setupview = (lat, lon) ->
    @map = L.map('map').setView([lat, lon], 5);
    L.tileLayer('http://{s}.tiles.mapbox.com/v3/nateguy.ip5nk518/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
      maxZoom: 18
    }).addTo(map)

  panMap = (lat, lon, map) -> map.panTo([lat, lon])


  showMarker = (lat, lon, map, city) ->
    list = "Guides in: #{city}<br>"
    t = L.marker([lat, lon]).addTo(map)
    guidelocations = $('.guidelocations')

    for i in guidelocations
      i = $(i)
      if i.data('location') == city

        link = "/guides/" + i.data('id')
        firstname = i.data('firstname')
        avatar = i.data('avatar')

        list = list + "<a href=#{link}><img width=40 src=#{avatar}></a>"

    list = list + "<br><a href='guides/location/#{city}'>See more...</a>"
    t.bindPopup(list).openPopup();
    #t.bindPopup("<%= %>").openPopup();



  marker = (map) ->
    mapitems = $('.mapitem')

    for i in mapitems
      i = $(i)
      city = i.data('city')
      lat = i.data('lat')
      lon = i.data('lon')
      console.log city + " " + lat + " " + lon
      showMarker(lat, lon, map, city)

  Setupview(22.279774, 114.153814)
  marker(map)

  $('#closebutton').click ->
    console.log "heyheyhey"
    $('.languageadd').css({"display":"none"})
    $('.overlay').css({"display":"none"})

  $('#displayLanguageButton').click ->
    displayLanguage()

  map.on('click', onMapClick)




onMapClick = (e) ->
  popup = L.popup();
  lat = e.latlng.lat
  lon = e.latlng.lng
  console.log lat + " " + lon
  t = codeLatLng(lat, lon)


  popup
      .setLatLng(e.latlng)
      .setContent("here " + t)
      .openOn(map);
      $('.clicklocation').html("<% Geocoder.search([#{lat}, #{lon}]) %>")





displayLanguage = ->

  $('.languageadd').css({"display":"block"})
  $('.overlay').css({"display":"block"})

initialize = ->
  geocoder = new google.maps.Geocoder();

storeResult = (result) ->
  locality = result

codeLatLng = (lat, lng) ->
  result = ""
  latlng = new google.maps.LatLng(lat, lng)

  geocodeCallback = (results, status) ->

    findLocality = (results) ->
      for address in results
        for address_component in address.address_components
          for type in address_component.types
            if type == "locality"
              console.log "run 1 " + address_component.short_name
              storeResult(address_component.short_name)
              return address_component.short_name
      return undefined

    if (status == google.maps.GeocoderStatus.OK)
      if (results.length != 0)
        storeResult(findLocality(results))
      else
        result = 'No results found'
    else
      result = 'Geocoder failed due to: ' + status

  geocoder.geocode({'latLng': latlng}, geocodeCallback)
  return locality





