# Cashier App

This is a simple cashier function app that adds products to a cart and displays the total price.

## Project Setup
Run PostgreSQL.

`git clone` the repo and run:

### Install libraries
`bundle install`

### Seed development data
Change the `database.yml` file according to your system settings, set username and password.
```
rails db:create
rails db:migrate
rails db:seed
```

### Run tests
`rspec spec`

### Start the rails console for testing
`rails c`

```ruby
# Basket: GR1,SR1,GR1,GR1,CF1
Cart.all[0].total_price
# returns 22.45

```

```ruby
# Basket: GR1,GR1
Cart.all[1].total_price
# returns 3.11

```

```ruby
# Basket: SR1,SR1,GR1,SR1
Cart.all[0].total_price
# returns 16.61

```

```ruby
# Basket: GR1,CF1,SR1,CF1,CF1
Cart.all[0].total_price
# returns 30.57

```

```ruby
# if in future we need add multiple discounts for a single product, e.g.
# Basket: GR1,GR1,GR1
gr1 = Product.find_by(product_code: 'GR1')
cart = Cart.create
LineItem.create(cart: cart, product: gr1, quantity: 3)

# creating new discount
Discount.find_or_create_by(name: 'DropProductPrice', product: gr1, priority: 1, quantity_condition: 3, value: 2.72)

cart.total_price
# returns 5.44
# 1. DropProductPrice: reduces price from 3.11 to new 2.72 if quantity >= 3
# => 3 * 2.72 = 8.16
# 2. OnePlusOneFree: 1 from 3 is free:
# => 2 * 2.72 = 5.44

```
