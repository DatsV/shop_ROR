class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|

      t.belongs_to :user
      t.float :amount

      t.timestamps
    end
  end
end
