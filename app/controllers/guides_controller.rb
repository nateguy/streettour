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


  def comment
    if user_signed_in?
      user_id = params[:user_id]
      comments = Comment.new
      comments.title = params[:title]
      comments.content = params[:content]
      comments.user_id = user_id
      comments.commenter_id = User.current.id
    end

    if comments.save

      redirect_to :back
    else
      render text: "Error"
      redirect_to :back
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
      @y = Location.find_by city: params[:location]
      @guides = @y.users
    end
  #  @g = Guides.find_by_location(params[:location])
  end
end