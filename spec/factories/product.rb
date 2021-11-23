FactoryBot.define do
  factory :product do
    product_code { "PR_#{rand(100)}" }
    name { "Product #{rand(100)}" }
    price { (rand * 10).ceil(2) }

    trait :gr1 do
      product_code { 'GR1' }
      name { 'Green Tea' }
      price { 3.11 }
    end

    trait :sr1 do
      product_code { 'SR1' }
      name { 'Strawberries' }
      price { 5.00 }
    end

    trait :cf1 do
      product_code { 'CF1' }
      name { 'Coffee' }
      price { 11.23 }
    end

    # to not create duplicates
    initialize_with { Product.find_or_create_by(product_code: product_code, name: name, price: price) }
  end
end
