module User
  class Partner < Base
    include Mongoid::Document

    embeds_many :available_services

    has_many :orders
    has_and_belongs_to_many :services_boxes, after_add: :add_new_services, before_remove: :remove_services

    belongs_to :city

    accepts_nested_attributes_for :available_services

    delegate :name, :subdomain, to: :city, prefix: true

    validates_presence_of :city, uniqueness: true
    before_update :services_boxes_update

    def support_service?(service)
      available_services.where(service: service).count != 0
    end

    def payments
      orders_ids = orders.only(:_id).map(&:_id)
      Payment.where :order_id.in => orders_ids
    end

    def services
      services_ids = available_services.only(:service_id).map(&:service_id)
      Service.where :id.in => services_ids
    end

    private
    def services_boxes_update
      if services_box_ids_changed?
        actual = services_box_ids     || []
        was    = services_box_ids_was || []
        if actual.count > was.count
          new_services_box_ids = actual - was
          new_services_box_ids.each {|id| apply_service_box(ServicesBox.find(id))}
        else
          old_services_box_ids = was - actual
          old_services_box_ids.each {|id| remove_service_box(ServicesBox.find(id))}
        end
      end
    end

    def add_new_services(services_box)
      apply_service_box services_box
      save!
    end
    def remove_services(services_box)
      remove services_box
      save!
    end

    def apply_service_box(services_box)
      services_box.services.each do |service|
        available_services.build service: service unless support_service?(service)
      end
    end

    def remove_service_box(services_box)
      services_box.services.each do |service|
        available_services.where(service: service).delete
      end
    end
  end
end
