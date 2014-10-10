class Payment
  include Mongoid::Document
  include Mongoid::Timestamps

  STATUSES = %w(new paid)

  field :sum,    type: Float
  field :status, type: String

  belongs_to :order

  validates_inclusion_of :status, in: STATUSES
  validates_presence_of :order
end
