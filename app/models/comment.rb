class Comment < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  validates :rating, presence: true
  belongs_to :user
end
