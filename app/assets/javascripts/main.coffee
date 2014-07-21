geocoder = new google.maps.Geocoder()
locality = ""
rating_placeholder = 0

$ ->
  current_path = window.location.pathname



  setupView = (lat, lon) ->
    @map = L.map('map').setView([lat, lon], 4);
    L.tileLayer('http://{s}.tiles.mapbox.com/v3/nateguy.ip5nk518/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
      maxZoom: 18
    }).addTo(map)

  panMap = (lat, lon, map) -> map.panTo([lat, lon])

  showGuideMarkers = (lat, lon, map, city, id) ->

    guideImageLinksForCity = (city) ->

      buildLink = (guideId, avatar) ->
        "<a href=/guides/id/#{guideId}><image width=60 src=#{avatar}></a>"

      guides = ""

      guideInfos = $('.guidelocations')

      for guideInfo in guideInfos
        guideInfo = $(guideInfo)

        if guideInfo.data('location') == city

          link = buildLink(guideInfo.data('id'), guideInfo.data('avatar'))
          guides += link

      guides

    switch current_path
      when "/users/sign_up"
        header = "<span>#{city}</span>"
        content = ""
        footer = "<a onclick='idFunction(" + id + ")'>Select</a>"
      when "/"
        header = "<h3>Guides in: #{city}</h3>"
        content = guideImageLinksForCity(city)
        footer = "<p><a href='guides/#{city}'>See more...</a></p>"
      else
        header = "<p>#{city}</p>"
        content = "<a href='guides/#{city}'>See more guides...</a>"
        footer = ""


    popupContent = header + '<br>' + content + footer
    marker = L.marker([lat, lon]).addTo(map)
    marker.bindPopup(popupContent).openPopup()

  showPointers = (map) ->
    mapitems = $('.mapitem')

    for i in mapitems
      i = $(i)
      id = i.data('id')
      city = i.data('city')
      lat = i.data('lat')
      lon = i.data('lon')

      showGuideMarkers(lat, lon, map, city, id)

  mapitems = $('.mapitem')
  setupView( $(mapitems[0]).data('lat'), $(mapitems[0]).data('lon'))



  $('#closebutton').click ->
    $('.languageadd').css({"display":"none"})
    $('.overlay').css({"display":"none"})

  $('#displayLanguageButton').click ->
    displayLanguage()

  showPointers(map)

  if current_path is "/users/sign_up"
    map.on('click', onMapClick)



onMapClick = (e) ->
  console.log "onMapClick"
  codeLatLng(e)

displayLanguage = ->

  $('.languageadd').css({"display":"block"})
  $('.overlay').css({"display":"block"})


setLocationPin = (result, e) ->
  locality = result

  popup = L.popup();

  header_text = "<p>#{locality}</p>"
  content = "<form id='newlanguage' action='/guides/newlocation' method='post'>
  <input type='hidden' name='locality' value=" + "#{locality}" + ">
  <button type='submit' value='submit'>Add this location</button></p>"
  console.log locality
  popup
      .setLatLng(e.latlng)
      .setContent(header_text + content)
      .openOn(map);





codeLatLng = (e) ->
  lat = e.latlng.lat
  lon = e.latlng.lng
  console.log "codelatlng"
  result = ""
  latlng = new google.maps.LatLng(lat, lon)



  geocodeCallback = (results, status) ->

    findLocality = (results) ->
      for address in results
        for address_component in address.address_components
          for type in address_component.types
            if type == "locality"

              return address_component.short_name
      return undefined

    if (status == google.maps.GeocoderStatus.OK)
      if (results.length != 0)
        console.log "running"
        setLocationPin(findLocality(results), e)
      else
        result = 'No results found'
    else
      result = 'Geocoder failed due to: ' + status

  geocoder.geocode({'latLng': latlng}, geocodeCallback)

