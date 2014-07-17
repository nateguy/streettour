class SiteController < ApplicationController

  def index #listing of the following items

    @locations = Location.all
    @g = []

    # Only 4 guides are to be shown in the map box at a time
    # the following function randomizes the photos of guides that appear in the map box
    @locations.each do |i| #loop through guides in each location
      guide_loc = User.where(isguide: true, location_id: i)

      if guide_loc.length > 4
        rnd = (0..(guide_loc.length - 1) ).to_a.shuffle #shuffle

        for j in 0..3
          index = rnd[j]
          @g << guide_loc[index]
        end
      elsif guide_loc.length > 0
        for j in 0..(guide_loc.length - 1)
          @g << guide_loc[j]
        end
      end
    end

    # now is an internal array

  #  flash.now[:notice] = "You ARE weird"

    flash.now[:notice] = "hi"
  end

  def location

    @guides = User.where(isguide: true)
   #@g = @guides.select{ |guides.location| guides.location[params[:location]]}
    @guides_location = []
    @guides.each do |i|
      if i.location.city == params[:location]
        @guides_location << i
      end
    end
  #  @g = Guides.find_by_location(params[:location])

  end

  def privacy #static page
  end

  def terms
  end

  def about
       flash.now[:alert] = "About"
  end

end