class PaymentSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  attributes :id, :sum, :status, :order_id
end
