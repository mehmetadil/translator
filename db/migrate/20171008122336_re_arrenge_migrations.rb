class ReArrengeMigrations < ActiveRecord::Migration[5.1]
  def change
    rename_column :tasks, :article_id, :translated_article_id
    rename_column :tasks, :user_id, :translator_id
  end
end
