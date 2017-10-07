class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :status, default: "In Progress"
      t.date :completed_at
      t.integer :article_id
      t.integer :user_id
      t.integer :language_id
      t.integer :offer_id

      t.timestamps
    end
  end
end
