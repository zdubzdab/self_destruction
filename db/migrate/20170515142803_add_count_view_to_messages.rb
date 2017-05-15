class AddCountViewToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :count_view, :integer, default: 0
  end
end
