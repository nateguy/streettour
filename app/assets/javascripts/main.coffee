$ ->

  console.log "Coffee in rails"
  displayLogin()

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



displayLogin = ->
  $('.login_box').fadeIn()
  $('.login_box').css({"display":"block"})
