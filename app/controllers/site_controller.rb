class SiteController < ApplicationController

  def index #listing of the following items
    # now is an internal array
  #  flash.now[:alert] = "There is no URL. 404"
  #  flash.now[:notice] = "You ARE weird"
    flash.now[:notice] = "You WON!!!!!"
  end

  def privacy #static page
  end

  def terms
  end

end