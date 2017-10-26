class CreateTranslatedArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :translated_articles do |t|
      t.string :name
      t.text :description
      t.integer :language_id
      t.integer :article_id

      t.timestamps
    end
  end
end
