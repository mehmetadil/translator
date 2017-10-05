class CreateArticleMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :article_materials do |t|
      t.text :description
      t.integer :article_id

      t.timestamps
    end
  end
end
