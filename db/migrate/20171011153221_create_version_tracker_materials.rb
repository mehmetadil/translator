class CreateVersionTrackerMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :version_tracker_materials do |t|
      t.text :description
      t.integer :version_tracker_id

      t.timestamps
    end
  end
end
