class Post < ActiveRecord::Base

  belongs_to :group
  validates :content, :presence => true
  belongs_to :author, :class_name => "User", :foreign_key => :user_id
  

  def editable_by?(user)
    user && user == author
  end

end
