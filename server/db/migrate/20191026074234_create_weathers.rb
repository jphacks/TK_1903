class CreateWeathers < ActiveRecord::Migration[6.0]
  def change
    create_table :weathers do |t|
      t.string :zipcode
      t.string :main, default: ''

      t.timestamps
    end
    add_index :weathers, :zipcode
  end
end
