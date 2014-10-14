class OrderSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :cost, :client_email, :client_name, :client_phone, :service_name, :status, :available_service_id,
             :created_at, :updated_at, :payment_ids

  def payment_ids
    object.payments.only(:_id).map {|p| p.id.to_s}
  end

  def available_service_id
    if object.partner.present?
      object.partner.available_services.find_by(service: object.service).id.to_s
    else
      nil
    end
  end
end
