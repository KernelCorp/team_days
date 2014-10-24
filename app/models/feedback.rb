class Feedback
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name
  field :text
  has_mongoid_attached_file :attachment,
                            :styles => {
                                :original => ['1920x1680>', :jpg],
                                :small    => ['100x100#',   :jpg],
                                :medium   => ['250x250',    :jpg],
                                :large    => ['500x500>',   :jpg]
                            }
  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png)

end