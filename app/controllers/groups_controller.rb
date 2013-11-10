class GroupsController < ApplicationController

  before_action :login_required, :only => [:new, :create, :edit,:update,:destroy]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
  end

  def new
    @group = current_user.groups.build(group_params)
  end

  def create
    @group = Group.new(group_params)
    if @group.save 
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = current_user.groups.find(params[:id])
  end


  def update
    @group = current_user.groups.find(params[:id])
    if @group.update(group_params) 
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def destroy
    @group = current_user.groups.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  def join
    @group = Group.find(params[:id])
    if !current_user.is_member_of?(@group) 
      current_user.join!(@group)
    else
      flash[:warning] = "You already joined this group."
    end
    redirect_to group_path(@group)
  end

  def quit
    @group = Group.find(params[:id])
    if current_user.is_member_of?(@group)
     current_user.quit!(@group)
    else
      flash[:warning] = "You are not member of this group."
    end
    redirect_to group_path(@group)
  end


  private

  def group_params
    params.require(:group).permit(:title, :description)
  end

end
