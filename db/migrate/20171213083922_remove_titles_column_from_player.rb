class RemoveTitlesColumnFromPlayer < ActiveRecord::Migration[5.1]
  def change
    remove_column :players, :titles
  end
end
