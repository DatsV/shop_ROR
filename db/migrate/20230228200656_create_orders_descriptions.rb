class CreateOrdersDescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :orders_descriptions do |t|

      t.belongs_to :order
      t.belongs_to :item
      t.integer :quantity


      t.timestamps
    end
  end
end
