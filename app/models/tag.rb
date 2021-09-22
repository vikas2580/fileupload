class Tag < ApplicationRecord
  has_many :attachment_tags
  has_many :attachments, through: :attachment_tags 
end
