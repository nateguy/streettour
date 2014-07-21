class GuidesController < ApplicationController
  protect_from_forgery with: :null_session,  :except => [:comment]

  def index #listing of the following items either with a location variable or not

    if params[:location].blank?
      @guides = User.where(isguide: true)
    else
      @guides = (Location.find_by city: params[:location]).users.where(isguide: true)

    end
  end


  def show #show profile
    user_id  = params[:id]
    commenter_id = params[:commenter_id]
    @profile = User.find(user_id)

    if user_id.blank?
      @post = Comment.all
    else
      @post = Comment.where(user_id: user_id)

    end
  end

  def newlocation #create new location
    newcity = params[:locality].capitalize
    a = Location.find_by city: newcity
    if a.nil? == true
      newlocation = Location.new
      newlocation.city = newcity
      if newlocation.save
        flash.now[:notice] = "Location added"
      else
        flash.now[:notice] = "Location add failed"
      end
    else
      flash[:notice] = "Location exists"
    end
    redirect_to :back
  end

  def newlanguage
    language = params[:language]
    @languages = Language.find_by language: language

    if @languages.nil? == true
      newlanguage = Language.new
      newlanguage.language = language.capitalize
      if newlanguage.save
        flash.now[:notice] = "Language added"
      else
        flash.now[:notice] = "Language add failed"
      end
    else
      flash[:notice] = "Language exists"
    end
    redirect_to :back
  end


  def comment
    if user_signed_in?
      user_id = params[:user_id]
      comments = Comment.new
      comments.title = params[:title]
      comments.content = params[:content]
      comments.user_id = user_id
      comments.rating = params[:rating]
      comments.commenter_id = User.current.id

      if comments.save == false
        flash.now[:notice] = "Sorry there was an error"
      end
      redirect_to :back
    end
  end


end