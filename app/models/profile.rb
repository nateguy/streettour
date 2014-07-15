class Profile < ActiveRecord::Base
  before_save :check_username #before_save is a function, check_username is referring to a function

  validate :check_at

  #self is the model itself

  def check_username
    if self.username.blank?
      self.errors.add :base, 'original URL should not be blank'
    end

  #  self.username = self.username + '@gmail.com'
  end

  def check_at
    unless self.username.include? "@"
      self.errors.add :base, "email should contain @"
    end
  end

end
