class AddAttachmentFileContentToArticleMaterials < ActiveRecord::Migration[5.1]
  def self.up
    change_table :article_materials do |t|
      t.attachment :material
    end
  end

  def self.down
    remove_attachment :article_materials, :file_content
  end
end
