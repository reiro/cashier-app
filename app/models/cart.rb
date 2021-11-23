class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def total_price
    line_items.sum do |line_item|
      line_item.final_line_price.round(2)
    end
  end
end
