class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.belongs_to :product, index: true
      t.belongs_to :cart, index: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
