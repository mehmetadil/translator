class AddOwnerIdToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :owner_id, :integer, after: :translator_id
  end
end
