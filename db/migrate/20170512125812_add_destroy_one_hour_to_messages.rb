class AddDestroyOneHourToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :destroy_one_hour, :boolean, default: false
  end
end
