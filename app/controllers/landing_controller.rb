class LandingController < ApplicationController
  def show
    @services = Service.all
    @companies = Company.all
    @photoreports = PhotoReport.all
  end

end
