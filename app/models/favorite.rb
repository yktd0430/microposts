class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  
  validates :user_id, uniqueness: { scope: :micropost_id }, presence: true
  validates :micropost_id, presence: true
end
