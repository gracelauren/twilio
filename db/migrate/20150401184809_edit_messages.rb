class EditMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :from, :string
    add_column :messages, :from, :string, :default => '15005550006'
  end
end
