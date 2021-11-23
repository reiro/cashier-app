class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  # use includes to reduce DB calls inside LineItems::TotalPriceService calculations
  def total_price
    line_items.includes(product: [:discounts]).sum do |line_item|
      line_item.final_line_price.round(2)
    end
  end
end
