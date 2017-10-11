class AddAttachmentMaterialToVersionTrackerMaterials < ActiveRecord::Migration[5.1]
  def self.up
    change_table :version_tracker_materials do |t|
      t.attachment :material
    end
  end

  def self.down
    remove_attachment :version_tracker_materials, :material
  end
end
