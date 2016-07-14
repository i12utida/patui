class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :jan_code, limit:8
      t.string :product_name
      t.integer :product_stack
      t.integer :product_cost
      t.string :product_type

      t.timestamps null: false
    end
  end
end
