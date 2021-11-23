module Discounts
  class DropTotalPrice < Base
    def call
      state[:quantity] >= quantity_condition ? new_state : state
    end

    private

    def new_total
      ((new_quantity * new_price) * discount_value).round(2)
    end
  end
end
