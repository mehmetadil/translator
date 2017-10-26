class ReArrengeMigrations < ActiveRecord::Migration[5.1]
  def change
    rename_column :tasks, :article_id, :translated_article_id
    rename_column :tasks, :user_id, :translator_id
    rename_column :offers, :user_id, :translator_id
    rename_column :offers, :article_id, :translate_order_id
    remove_column :offers, :source_language_id
    remove_column :offers, :target_language_id
  end
end
