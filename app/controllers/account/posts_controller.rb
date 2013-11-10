class Account::PostsController < ApplicationController

  before_filter :login_required
  
  def index
    @posts = current_user.posts.order("updated_at DESC")
  end

end
