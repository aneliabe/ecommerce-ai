class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :birth_date, :date
    add_column :users, :avatar, :string
  end
end
