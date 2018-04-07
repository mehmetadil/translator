class RemoveProjectIdfromTask < ActiveRecord::Migration[5.1]
  def change
  	remove_column :tasks, :zanata_project_id
  	add_column :articles, :project_id, :string
  end
end
