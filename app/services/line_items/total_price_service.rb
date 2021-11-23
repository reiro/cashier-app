module LineItems
  class TotalPriceService
    attr_reader :line_item

    def initialize(line_item)
      @line_item = line_item
    end

    def call
      apply_discounts

      state[:total].round(2)
    end

    private

    # if in future there will be few discounts applied to a single product, 
    # discounts will iteractively apply according to a priority
    def apply_discounts
      discounts.order(priority: :asc).map do |discount|
        @state = discount.service_class_name.new(state, discount.quantity_condition, discount.value).call
      end
    end

    def state
      @state ||= { quantity: original_quantity, price: original_price, total: original_quantity * original_price }
    end

    def discounts
      line_item.product.discounts
    end

    def original_quantity
      @original_quantity ||= line_item.quantity
    end

    def original_price
      @original_price ||= line_item.product.price
    end
  end
end
