class GuidesController < ApplicationController
  protect_from_forgery with: :null_session,  :except => [:comment]



  def index #listing of the following items
    #@guides = User.all

    @guides = User.where(isguide: true)
    @locations = Location.all

  #  guides.username = params[:name] #parameter/value name of html username
  #  flash.now[:notice] = guides.username

  end

  def new
  end




  def show

    user_id  = params[:id]
    commenter_id = params[:commenter_id]
    @g = User.find(user_id)
    @c = User.all


    if user_id.blank?
      @post = Comment.all
    else
      @post = Comment.where(user_id: user_id)

#@posts = p.comments
    end
  end

  def newlocation
    string = params[:locality].capitalize
    a = Location.find_by city: string
    if a.nil? == true
      newlocation = Location.new
      newlocation.city = string

      if newlocation.save
        redirect_to :back
        flash.now[:notice] = "Location added"
      else
        flash.now[:notice] = "Location add failed"
        redirect_to :back
      end
    end
  end

  def language
    string = params[:language].capitalize
    a = Language.find_by language: string

    if a.nil? == true
      newlang = Language.new
      newlang.language = string

      if newlang.save
        redirect_to :back
        flash.now[:notice] = "Language added"

      else
        flash.now[:notice] = "Language add failed"
        redirect_to :back
      end
    end
  end

  def comment
    if user_signed_in?
      user_id = params[:user_id]
      comments = Comment.new
      comments.title = params[:title]
      comments.content = params[:content]
      comments.user_id = user_id
      comments.commenter_id = User.current.id


      if comments.save

        redirect_to :back
      else
        flash.now[:notice] = "Sorry there was an error"
        redirect_to :back

      end
    end
  end

  def create

    guides = Guides.new
    guides.name = params[:name] #parameter/value name of html username
    guides.location = params[:location]
    guides.description = params[:description]
    flash.now[:notice] = guides.name
    #if the bottom returns false, it cannot be saved
    if guides.save
      render :create
      #redirect_to root_path #if successful, redirect to root directory
    else
      render :text, "Error" #return error message if fail
    end
  end


  def locations
    if params[:location] != ""
      @y = (Location.find_by city: params[:location]).users
      @guides = @y.where(isguide: true)
    end
  #  @g = Guides.find_by_location(params[:location])
  end
end