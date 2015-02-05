class Service
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name
  field :price, type: Float
  field :description

  has_mongoid_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_and_belongs_to_many :services_boxes

  validates_uniqueness_of :name

  def service_id; id; end
end
