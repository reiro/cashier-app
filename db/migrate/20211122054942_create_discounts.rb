class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.string :name
      t.integer :priority
      t.integer :quantity_condition, default: 0
      t.float :value
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
