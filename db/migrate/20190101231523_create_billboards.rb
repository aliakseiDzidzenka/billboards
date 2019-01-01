class CreateBillboards < ActiveRecord::Migration[5.2]
  def change
    create_table :billboards do |t|

      t.timestamps
    end
  end
end
