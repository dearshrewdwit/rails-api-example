class RenameColumnTypeInTitlesToTitleType < ActiveRecord::Migration[5.1]
  def change
    rename_column :titles, :type, :title_type
  end
end
