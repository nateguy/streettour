class SiteController < ApplicationController

  def index #listing of the following items
    @r = Location.all
    # now is an internal array
  #  flash.now[:alert] = "There is no URL. 404"
  #  flash.now[:notice] = "You ARE weird"

  #  flash.now[:notice] = "hi"
  end

  def privacy #static page
  end

  def terms
  end

  def about
  end

end