class TagsController < ApplicationController
  load_and_authorize_resource class: 'Blog::Tag'
  respond_to :html


  def show
    respond_with @tag
  end
end