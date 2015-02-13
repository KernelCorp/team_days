class Service
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name
  field :price, type: Float
  field :description
  field :joy, type: Integer, default: 1
  field :health, type: Integer, default: 1
  field :loyalty, type: Integer, default: 1
  field :motivation, type: Integer, default: 1
  field :link_to_video, type: String


  has_mongoid_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_and_belongs_to_many :services_boxes

  validates_uniqueness_of :name
  validates :joy, :health, :loyalty, :motivation, length: { in: 1..5}

  def service_id; id; end
end
