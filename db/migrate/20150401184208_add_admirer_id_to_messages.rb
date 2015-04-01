class AddAdmirerIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :admirer_id, :integer
  end
end
