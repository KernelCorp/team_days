class ServicesBox
  include Mongoid::Document

  field :name,  type: String
  field :price, type: Float

  has_and_belongs_to_many :partners, class_name: 'User::Partner'
  has_and_belongs_to_many :services
end
