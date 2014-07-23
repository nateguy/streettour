$ ->
  post_id = $(".rating_box").data('id')

  rating_boxes = $('.rating_box')


  drawRatingTable = (classname, postid) ->
    console.log ".#{classname}"
    $(".#{classname}").html('<div class="star s1 p' + postid + '" id="1"></div>
      <div class="star s2 p' + postid + '" id="2"></div>
      <div class="star s3 p' + postid + '" id="3"></div>
      <div class="star s4 p' + postid + '" id="4"></div>
      <div class="star s5 p' + postid + '" id="5"></div>')

  drawRatingTable("rating_box_comment", "c")
  drawRatingTable("rating_box_avg", "a")

  for rating_box in rating_boxes
    rating_box = $(rating_box)
    postid = rating_box.data('postid')
    rating = rating_box.data('rating')

    drawRatingTable("rating_box.p#{postid}", "#{postid}")
    ratingbox(rating, postid)

  ratingbox($(".rating_box_avg").data('rating'), 'a')
  ratingbox($(".rating_value").val(), 'c')

  $(".rating_box_comment .star").hover(
    ->
      if parseInt($(".rating_value").val()) == 0
        ratingbox(this.id, "c")
      $(".star").click ->
        ratingbox(this.id, "c")
        $(".rating_value").val(this.id)
    ->
      ratingbox($(".rating_value").val(), 'c' )
      )

ratingbox = (i, post_id) ->

  t = ".p#{post_id}"

  for j in [1..5]
    $(".s#{j}#{t}").css("background-color", "#999999")
    $(".s#{j}#{t}").css("border-left", "")

  for j in [1..parseInt(i)] when i > 0
    $(".s#{j}#{t}").css("border-left", "20px solid rgb(255,100,0)")
  i_decimal = 20 * (i - parseInt(i))
  $(".s#{j}#{t}").css("border-left", "#{i_decimal}px solid rgb(255,100,0)")


