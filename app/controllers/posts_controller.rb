class PostsController < ApplicationController


 def new
   @group = Group.find(params[:group_id])
   @post = @group.posts.build
 end


end
