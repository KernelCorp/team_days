class ClientInfo
  include Mongoid::Document

  field :name,  type: String
  field :phone, type: String
  field :email, type: String

  embedded_in :order
end
