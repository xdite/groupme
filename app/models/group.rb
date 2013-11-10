class Group < ActiveRecord::Base


  has_many :posts
  validates :title, :presence => true
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id

  has_many :group_users
  has_many :participated_groups, :through => :group_users, :source => :group

  after_create :join_owner_to_group

  def editable_by?(user)
    user && user == owner
  end

  def join_owner_to_group
    members << owner
  end

end
