gr1 = Product.find_or_create_by(product_code: 'GR1', name: 'Green Tea', price: 3.11)
sr1 = Product.find_or_create_by(product_code: 'SR1', name: 'Strawberries', price: 5.00)
cf1 = Product.find_or_create_by(product_code: 'CF1', name: 'Coffee', price: 11.23)

Discount.find_or_create_by(name: 'Discounts::OnePlusOneFree', product: gr1, priority: 2, quantity_condition: 2)
Discount.find_or_create_by(name: 'Discounts::DropProductPrice', product: sr1, priority: 1, quantity_condition: 3, value: 4.5)
Discount.find_or_create_by(name: 'Discounts::DropTotalPrice', product: cf1, priority: 3, quantity_condition: 3, value: 2/BigDecimal(3))
