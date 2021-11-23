FactoryBot.define do
  factory :cart do
    trait :with_products_1 do
      after(:create) do |cart|
        LineItem.create(cart: cart, product: FactoryBot.create(:product, :gr1), quantity: 3)
        LineItem.create(cart: cart, product: FactoryBot.create(:product, :sr1), quantity: 1)
        LineItem.create(cart: cart, product: FactoryBot.create(:product, :cf1), quantity: 1)
      end
    end

    trait :with_products_2 do
      after(:create) do |cart|
        LineItem.create(cart: cart, product: FactoryBot.create(:product, :gr1), quantity: 2)
      end
    end

    trait :with_products_3 do
      after(:create) do |cart|
        LineItem.create(cart: cart, product: FactoryBot.create(:product, :gr1), quantity: 1)
        LineItem.create(cart: cart, product: FactoryBot.create(:product, :sr1), quantity: 3)
      end
    end

    trait :with_products_4 do
      after(:create) do |cart|
        LineItem.create(cart: cart, product: FactoryBot.create(:product, :gr1), quantity: 1)
        LineItem.create(cart: cart, product: FactoryBot.create(:product, :sr1), quantity: 1)
        LineItem.create(cart: cart, product: FactoryBot.create(:product, :cf1), quantity: 3)
      end
    end
  end
end
