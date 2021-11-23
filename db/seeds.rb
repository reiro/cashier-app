gr1 = Product.find_or_create_by(product_code: 'GR1', name: 'Green Tea', price: 3.11)
sr1 = Product.find_or_create_by(product_code: 'SR1', name: 'Strawberries', price: 5.00)
cf1 = Product.find_or_create_by(product_code: 'CF1', name: 'Coffee', price: 11.23)

Discount.find_or_create_by(name: 'OnePlusOneFree', product: gr1, priority: 2, quantity_condition: 2)
Discount.find_or_create_by(name: 'DropProductPrice', product: sr1, priority: 1, quantity_condition: 3, value: 4.5)
Discount.find_or_create_by(name: 'DropTotalPrice', product: cf1, priority: 3, quantity_condition: 3, value: 2/BigDecimal(3))

def create_carts_for_testing
  Cart.destroy_all

  gr1 = Product.find_by(product_code: 'GR1')
  sr1 = Product.find_by(product_code: 'SR1')
  cf1 = Product.find_by(product_code: 'CF1')

  cart1 = Cart.create
  LineItem.create(cart: cart1, product: gr1, quantity: 3)
  LineItem.create(cart: cart1, product: sr1, quantity: 1)
  LineItem.create(cart: cart1, product: cf1, quantity: 1)

  cart2 = Cart.create
  LineItem.create(cart: cart2, product: gr1, quantity: 2)

  cart3 = Cart.create
  LineItem.create(cart: cart3, product: gr1, quantity: 1)
  LineItem.create(cart: cart3, product: sr1, quantity: 3)

  cart4 = Cart.create
  LineItem.create(cart: cart4, product: gr1, quantity: 1)
  LineItem.create(cart: cart4, product: sr1, quantity: 1)
  LineItem.create(cart: cart4, product: cf1, quantity: 3)
end

create_carts_for_testing unless Rails.env.test?
