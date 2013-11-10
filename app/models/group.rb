class Group < ActiveRecord::Base


  has_many :posts
  validates :title, :presence => true
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id

  def editable_by?(user)
    user && user == owner
  end

end
