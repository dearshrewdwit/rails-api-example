class CreatePlayer < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.float :age
      t.integer :prize_money
      t.integer :titles
      t.integer :grand_slams

      t.timestamps
    end
  end
end
