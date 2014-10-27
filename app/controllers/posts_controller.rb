class PostsController < ApplicationController

  load_and_authorize_resource class: 'Blog::Post'

  respond_to :html

  def show
    respond_with @post
  end

end