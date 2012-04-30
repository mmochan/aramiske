class PostsController < ApplicationController
  
  def new
    @post = @blog.new_post
  end
  
  def create
    @post = @blog.new_post(params[:post])   
    if  @post.publish
      redirect_to root_path, notice: "Post added!"
    else
       flash[:error] = 'A title might be a good start'
      render "new", notice: "Post not added!"
    end
  end
end
