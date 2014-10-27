class Subscription
  include Mongoid::Document
  field :email, type: String

  has_and_belongs_to_many :categories, class_name: 'Blog::Category'

  validates_uniqueness_of :email
  validates_format_of :email, with: /\A[_a-z0-9-]+(?:\.[_a-z0-9-]+)*@(?:[a-z0-9-]+\.)+[a-z]{2,}\z/i
end
