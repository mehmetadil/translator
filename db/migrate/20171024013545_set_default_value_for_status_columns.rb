class SetDefaultValueForStatusColumns < ActiveRecord::Migration[5.1]

  def up
  change_column :tasks, :status, :integer, default: 0
  change_column :offers, :status, :integer, default: 0
  end

  def down
  change_column :tasks, :status, :integer
  change_column :offers, :status, :integer  
  end
end
