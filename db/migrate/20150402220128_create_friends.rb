class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.string :phone
      t.integer :admirer_id
    end
  end
end
