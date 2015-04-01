class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.string :to
      t.string :from

      t.timestamps
    end
  end
end
