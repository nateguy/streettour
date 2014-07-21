$ ->
  ratingbox ( parseInt($(".rating_value").val()) )

  $(".star").hover(
    ->
      if parseInt($(".rating_value").val()) == 0
        ratingbox(this.id)
      $(".star").click ->
        ratingbox(this.id)
        $(".rating_value").val(this.id)
    ->
      ratingbox( parseInt($(".rating_value").val()) )
      )

ratingbox = (i) ->

  for j in [1..5]
    $(".s#{j}").css("background-color", "#999999")
  for j in [1..i] when i > 0
    $(".s#{j}").css("background-color", "rgb(255,100,0)")
