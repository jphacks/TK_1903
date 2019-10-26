class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :macaddr
      t.string :zipcode
      t.boolean :umbrella1, default: false
      t.boolean :umbrella2, default: false

      t.timestamps
    end
    add_index :users, :macaddr
    add_index :users, :zipcode
  end
end
