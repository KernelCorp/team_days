class Photo
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :photo
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  embedded_in :photo_report


end
