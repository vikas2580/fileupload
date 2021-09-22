class AttachmentsTags < ActiveRecord::Migration[6.1]
  def change
    create_table :attachment_tags do |t|
      t.references :attachment, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end
  end
end
