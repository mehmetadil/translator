class CreateVersionTrackerComments < ActiveRecord::Migration[5.1]
  def change
    create_table :version_tracker_comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :version_tracker_id

      t.timestamps
    end
  end
end
