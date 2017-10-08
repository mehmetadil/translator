class CreateTranslateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :translate_orders do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :source_language_id
      t.integer :target_language_id
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
