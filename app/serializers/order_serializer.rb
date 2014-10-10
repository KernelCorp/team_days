class OrderSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :cost, :client_email, :client_name, :client_phone, :service_name, :status
end
