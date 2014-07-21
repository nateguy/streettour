class RegistrationsController < Devise::RegistrationsController

  def create

    @locations = Location.all
    super

    language_ids = params[:user][:language_ids] #grab IDS
    language_ids.each do |id|
      @user.languages << Language.find(id) unless id.blank?

    end
  end

  def update
    super

    language_ids = params[:user][:language_ids] #grab IDS
    language_ids.each do |id|
      @user.languages << Language.find(id) unless id.blank?
    end
  end

  def new
    @locations = Location.all
    super
  end


  private


  def sign_up_params
    @languages = Language.all

    params.require(:user).permit(:firstname, :surname, :location_id, :isguide, :description, :email, :avatar, :password, :password_confirmation, :languages )
  end

  def account_update_params
    params.require(:user).permit(:firstname, :surname, :location_id, :isguide, :description, :email, :avatar, :password, :password_confirmation, :current_password, :languages )
  end
end