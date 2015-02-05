class LandingController < ApplicationController
  def show
    @services = Service.all
  end

end
