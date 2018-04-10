class AddAboutMeColumnToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :about_me, :string
    add_column :profiles, :text, :string
  end
end
