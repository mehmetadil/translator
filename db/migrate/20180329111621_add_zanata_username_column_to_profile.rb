class AddZanataUsernameColumnToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :zanata_username, :string
  end
end
