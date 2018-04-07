class AddZanataProjectIdColumnToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :zanata_project_id, :string
  end
end
