FactoryBot.define do
  factory :line_item do
    quantity { 3 }
    product { create(:product) }
    cart { create(:cart) }
  end
end
