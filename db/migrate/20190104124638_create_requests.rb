class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|

    	t.datetime :start
    	t.datetime :end
    	t.string :brand
    	t.string :description
    	t.boolean :approved?, 				default: :false

    	t.belongs_to :user, 					index: true
    	t.belongs_to :billboard, 			index: true
      t.timestamps
    end
  end
end
