module User
  class Partner < Base
    include Mongoid::Document

    embeds_many :available_services

    has_many :orders
    has_and_belongs_to_many :services_boxes, after_add: :add_new_services, before_remove: :remove_services

    belongs_to :city

    accepts_nested_attributes_for :available_services

    validates_presence_of :city, uniqueness: true

    def support_service?(service)
      available_services.where(service: service).count != 0
    end

    def payments
      orders_ids = orders.only(:_id).map(&:_id)
      Payment.where :order_id.in => orders_ids
    end

    private
    def add_new_services(services_box)
      services_box.services.each do |service|
        available_services.build service: service unless support_service?(service)
      end
      self.save!
    end
    def remove_services(services_box)
      services_box.services.each do |service|
        available_services.where(service: service).destroy
      end
    end
  end
end
