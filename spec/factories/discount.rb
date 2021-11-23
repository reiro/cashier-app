FactoryBot.define do
  factory :discount do
    name { "Discount_#{rand(100)}" }
    priority { rand(1..3) }
    quantity_condition { rand(1..3) }
    product { create(:product) }
  end
end
