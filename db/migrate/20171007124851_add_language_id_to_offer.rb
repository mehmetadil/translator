class AddLanguageIdToOffer < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :source_language_id, :integer
    add_column :offers, :target_language_id, :integer
  end
end
