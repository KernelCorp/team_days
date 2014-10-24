class PostsController < ApplicationController

  load_and_authorize_resource

  respond_to :html

  def show
    respond_with @post
  end

end