class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :sum, :status, :order_id
end
