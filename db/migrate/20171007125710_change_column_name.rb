class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :source_language_id, :integer
    rename_column :tasks, :language_id, :target_language_id
  end
end
