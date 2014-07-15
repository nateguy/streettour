class GuidesController < ApplicationController
  protect_from_forgery with: :null_session,  :except => [:comment]



  def index #listing of the following items
    #@guides = User.all
    @guides = User.where(isguide: true)

  #  guides.username = params[:name] #parameter/value name of html username
  #  flash.now[:notice] = guides.username

  end

  def new
  end


  def location
    @guides = User.where(isguide: true)
   #@g = @guides.select{ |guides.location| guides.location[params[:location]]}
    @g = @guides.where(location: params[:location])
   # @g = Guides.find_by_location(params[:location])
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

    user_id = params[:user_id]
    com = Comment.new
    com.title = params[:title]
    com.content = params[:content]
    com.user_id = user_id
    com.commenter_id = User.current.id
    if com.save
      redirect_to action: 'show', id: params[:user_id]
      #render :show, :id=>params[:user_id]
    else
      render :text, "Error"
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

end