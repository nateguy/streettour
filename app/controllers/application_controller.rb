class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_current_user

  def set_current_user
    User.current = current_user
  end
#  def self.save(upload)
#    name = upload['datafile'].original_filename
#    directory = "public/data"
#    path = Guides.join(directory, name)
#    Guides.open(path, "wb") { |f| f.write(upload['datafile'].read)}
#  end
end
