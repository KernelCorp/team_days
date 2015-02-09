class PhotoReport
  include Mongoid::Document

  field :employee_name, type: String
  field :post, type: String
  field :mini_review, type: String
  field :review, type: String


  belongs_to :company
  embeds_many :photos
  accepts_nested_attributes_for :photos
end
