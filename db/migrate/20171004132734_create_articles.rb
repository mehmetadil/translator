class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :description
      t.integer :language_id
      t.integer :user_id

      t.timestamps
    end
  end
end
