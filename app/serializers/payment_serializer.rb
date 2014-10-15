class PaymentSerializer < ActiveModel::Serializer
  include MongoIdSerializer
  attributes :id, :sum, :status, :order_id, :created_at, :updated_at

  def order_id
    object.order.id.to_s
  end
end
