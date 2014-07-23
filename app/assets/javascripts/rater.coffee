$ ->
  console.log $(".rating_box").data('postid')
  post_id = $(".rating_box").data('id')

  rating_boxes = $('.rating_box')

  console.log rating_boxes

  $(".rating_box_comment").html('<div class="star s1 pc" id="1"></div>
      <div class="star s2 pc" id="2"></div>
      <div class="star s3 pc" id="3"></div>
      <div class="star s4 pc" id="4"></div>
      <div class="star s5 pc" id="5"></div>')


  for rating_box in rating_boxes
    rating_box = $(rating_box)
    i = rating_box.data('postid')
    rating = rating_box.data('rating')

    console.log "rat" +i
    $(".rating_box.p#{i}").html('<div class="star s1 p' + i + '" id="1"></div>
      <div class="star s2 p' + i + '" id="2"></div>
      <div class="star s3 p' + i + '" id="3"></div>
      <div class="star s4 p' + i + '" id="4"></div>
      <div class="star s5 p' + i + '" id="5"></div>')
    console.log $(".rating").html()
    ratingbox(parseInt(rating), parseInt(i) )


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

ratingbox = (i, post_id) ->
  console.log i + " " + post_id
  if post_id > 0
    t = ".p#{post_id}"
  else
    console.log post_id
    t = ".pc"
  console.log "t: "+t
  for j in [1..5]
    console.log ".s#{j}#{t}"
    $(".s#{j}#{t}").css("background-color", "#999999")
  for j in [1..i] when i > 0
    $(".s#{j}#{t}").css("background-color", "rgb(255,100,0)")
