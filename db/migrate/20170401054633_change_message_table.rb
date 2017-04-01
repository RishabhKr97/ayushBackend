class ChangeMessageTable < ActiveRecord::Migration[5.0]
  def up
   rename_column :messages, :user_id, :sender
  end
  
  def down
   rename_column :messages, :sender, :user_id
  end
end
