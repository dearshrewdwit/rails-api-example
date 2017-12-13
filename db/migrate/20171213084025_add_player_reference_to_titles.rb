class AddPlayerReferenceToTitles < ActiveRecord::Migration[5.1]
  def change
    add_reference :titles, :player, index: true
    add_foreign_key :titles, :players
  end
end
