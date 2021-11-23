class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def final_line_price
    LineItems::TotalPriceService.new(self).call
  end
end
