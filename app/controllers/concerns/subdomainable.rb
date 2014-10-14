module Subdomainable
  extend ActiveSupport::Concern

  protected
  def subdomain
    request.host =~ /(.*)\.#{Rails.application.config.host}/
    sub = $1
    sub == 'www' ? nil : sub
  end

  def get_partner
    subdomain = self.subdomain
    return nil if subdomain.blank?
    city = City.find_by subdomain: subdomain
    city.partner
  rescue Mongoid::Errors::DocumentNotFound
    nil
  end
end