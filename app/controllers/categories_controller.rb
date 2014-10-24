class CategoriesController < ApplicationController
  load_and_authorize_resource

  respond_to :html

  def index
    respond_with @categories
  end

  def show
    respond_with @category
  end

end