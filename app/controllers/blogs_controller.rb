class BlogsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @blogs = Blog.all

    responds_with(@blogs)
   
  end
end
