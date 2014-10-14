class Payment
  include Mongoid::Document
  include Mongoid::Timestamps

  STATUSES = %w(new paid)

  field :sum,    type: Float
  field :status, type: String, default: 'new'

  belongs_to :order

  scope :paid, -> {where status: 'paid'}

  validates_inclusion_of :status, in: STATUSES
  validates_presence_of :order
end
