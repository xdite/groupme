class Account::GroupsController < ApplicationController
  before_filter :login_required

  def index
    @groups = current_user.participated_groups.order("posts_count ASC")
  end

end
