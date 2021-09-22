class Attachment < ApplicationRecord

  mount_uploader :document, DocumentUploaderUploader
  ATTACHMENT_OPTIONS = %w(Public Private)
  belongs_to :user

  has_many :attachment_tags
  has_many :tags, through: :attachment_tags

  validate :file_size

  validates :attachment_type, :inclusion => {:in => ATTACHMENT_OPTIONS}

  validates_presence_of :title, :description, :attachment_type, :document

  def file_size
    size = document.file.size.to_f
    if size > 1.gigabytes.to_f
      errors.add(:document, "You cannot upload file greater than 1GB")
    end
 end
end
