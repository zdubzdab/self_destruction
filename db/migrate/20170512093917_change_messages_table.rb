class ChangeMessagesTable < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :key, :string
  end
end
