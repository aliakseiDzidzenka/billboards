class ChangeIsActiveColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :rents, :is_active?, :is_active
  	rename_column :requests, :approved?, :approved
  end
end
