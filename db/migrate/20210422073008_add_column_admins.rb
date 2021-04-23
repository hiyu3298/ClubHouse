class AddColumnAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :team_name, :string
    add_column :admins, :address, :string
    add_column :admins, :genre, :string
  end
end
