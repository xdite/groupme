class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:group])
    if @group.save redirect_to groups_path
    else
      render :new
    end
  end


  private
  
  def group_params
    params.require(:group).permit(:title, :description)
  end

end
