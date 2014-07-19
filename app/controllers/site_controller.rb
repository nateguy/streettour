class SiteController < ApplicationController

  def index #listing of the following items

    @locations = Location.all
    @locations_guides_images = []

    # Only 4 guides are to be shown in the map box at a time
    # the following function randomizes the photos of guides that appear in the map box
    @locations.each do |location_id| #loop through guides in each location
      guide_loc = User.where(isguide: true, location_id: location_id)

      if guide_loc.length > 4
        rnd = (0..(guide_loc.length - 1) ).to_a.shuffle #shuffle number indexes
        rnd = rnd.take(4)
        for index in rnd
          @locations_guides_images << guide_loc[index]
        end
      elsif guide_loc.length > 0
        for index in 0..(guide_loc.length - 1)
          @locations_guides_images << guide_loc[index]
        end
      end
    end



  end


  def privacy #static page
  end

  def terms
  end

  def about
  #     flash.now[:alert] = "About"
  end

end