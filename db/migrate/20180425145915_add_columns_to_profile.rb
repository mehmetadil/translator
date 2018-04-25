class AddColumnsToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :phone_number, :string
    add_column :profiles, :academic_title, :integer, default: 0
  end
end
