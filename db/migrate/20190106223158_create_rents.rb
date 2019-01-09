# frozen_string_literal: true

class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.string :ad_type
      t.string :brand
      t.string :description
      t.datetime :start
      t.datetime :end
      t.boolean :is_active?, default: true
      t.integer :board_id
      t.integer :user_id

      t.belongs_to :request, index: true
      t.timestamps
    end
  end
end
