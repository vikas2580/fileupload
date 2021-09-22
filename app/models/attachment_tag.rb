class AttachmentTag < ApplicationRecord
  attr_accessor :tag_id, :attachment_id
  belongs_to :tag
  belongs_to :attachment
end