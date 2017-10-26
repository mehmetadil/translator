class ChangeStatusTypeToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :offers, :status, :integer
    change_column :tasks, :status, :integer
  end
end
