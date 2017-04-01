class ChangeUsertable < ActiveRecord::Migration[5.0]
  def up
   rename_column :users, :type, :client 
  end
  def down
   rename_column :users, :client, :type
  end
end
