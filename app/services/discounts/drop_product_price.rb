module Discounts
  class DropProductPrice < Base
    def call
      state[:quantity] >= quantity_condition ? new_state : state
    end

    private

    def new_price
      discount_value
    end
  end
end
