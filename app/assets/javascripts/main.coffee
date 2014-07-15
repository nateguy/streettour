$ ->
  console.log "Coffee in rails"
  displayLogin()

  Setupview = (lat, lon) ->
    @map = L.map('map').setView([lat, lon], 7);
    L.tileLayer('http://{s}.tiles.mapbox.com/v3/nateguy.ip5nk518/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
      maxZoom: 18
    }).addTo(map)

  panMap = (lat, lon, map) -> map.panTo([lat, lon])
  showMarker = (lat, lon, map) -> L.marker([lat, lon]).addTo(map)

  marker = (map) ->
    mapitems = $('.mapitem')

    for i in mapitems
      i = $(i)
      lat = i.data('lat')
      lon = i.data('lon')
      console.log lat + " " + lon
      showMarker(lat, lon, map)

  Setupview(22.279774, 114.153814)
  marker(map)



displayLogin = ->
  $('.login_box').fadeIn()
  $('.login_box').css({"display":"block"})
