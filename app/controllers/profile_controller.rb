class ProfileController < ApplicationController
  protect_from_forgery with: :null_session
#listing, showing, create, delete
#GET: index
#POST: create
#GET: show
#PUT/PATCH: update

  def index
    flash.now[:notice] = "Lolz"
  end

  def create
    flash.now[:notice] = params[:username]
  end

  def update
  end

end