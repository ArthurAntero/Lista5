class RemoveFieldFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :isadmin, :string
  end
end
