class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.text :description
      t.integer :price
      t.integer :translation_time
      t.string :status, default: "Pending"
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
