class AddIndexToMessagesKey < ActiveRecord::Migration[5.0]
  def change
    add_index :messages, :key
  end
end
