class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.text :description
      t.integer :price
      t.integer :translation_time
      t.string :status
      t.integer :acticle_id
      t.integer :user_id

      t.timestamps
    end
  end
end
