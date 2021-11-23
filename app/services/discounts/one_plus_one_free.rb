module Discounts
  class OnePlusOneFree < Base
    def call
      state[:quantity] >= quantity_condition ? new_state : state
    end

    private

    def items_on_discount
      state[:quantity] - items_without_discount
    end

    def items_without_discount
      @items_without_discount ||= state[:quantity] % 2
    end

    def new_quantity
      (items_on_discount / 2) + items_without_discount
    end
  end
end
