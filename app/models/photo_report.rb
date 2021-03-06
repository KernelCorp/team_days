class PhotoReport
  include Mongoid::Document
  include Mongoid::Paperclip

  field :employee_name, type: String
  field :employee_post, type: String
  field :mini_review, type: String
  field :review, type: String


  has_mongoid_attached_file :employee_photo



  belongs_to :company
  embeds_many :photos, cascade_callbacks: true
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates_attachment_content_type :employee_photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :photos, presence: true

end
