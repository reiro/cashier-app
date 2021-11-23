module Discounts
  class Base
    attr_reader :state, :quantity_condition, :discount_value

    def initialize(state, quantity_condition, discount_value)
      @state = state
      @quantity_condition = quantity_condition
      @discount_value = discount_value
    end

    def call
      raise StandardError.new('This method should not be call directly from Base service')
    end

    private

    def new_state
      {
        quantity: new_quantity,
        price: new_price,
        total: new_total
      }
    end

    def new_quantity
      state[:quantity]
    end

    def new_price
      state[:price]
    end

    def new_total
      new_quantity * new_price
    end
  end
end