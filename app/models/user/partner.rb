module User
  class Partner < Base
    include Mongoid::Document

    embeds_many :available_services
    accepts_nested_attributes_for :available_services
  end
end
