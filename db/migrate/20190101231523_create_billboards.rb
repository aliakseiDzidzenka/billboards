class CreateBillboards < ActiveRecord::Migration[5.2]
  def change
    create_table :billboards do |t|
      
      t.string :city,              null: false, default: ""
      t.string :street,            null: false, default: ""
      t.string :house,             null: false, default: ""
      
      t.float :price

      t.timestamps null: false
    end
  end
end
