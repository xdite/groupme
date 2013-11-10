class Group < ActiveRecord::Base


  has_many :posts
  validates :title, :presence => true
  
end
