require 'rails_helper'

RSpec.describe LineItems::TotalPriceService, type: :service do
  let(:quantity) { 4 }
  let(:price) { product.price }
  let(:line_item) { create(:line_item, quantity: quantity, product: product) }

  let(:one_plus_one_free) do
    Discount.find_by(name: 'OnePlusOneFree')
  end

  let(:drop_product_price) do
    Discount.find_by(name: 'DropProductPrice')
  end

  let(:drop_total_price) do
    Discount.find_by(name: 'DropTotalPrice')
  end

  subject { described_class.new(line_item) }

  describe '#call' do
    context 'single discount: one_plus_one_free' do
      let(:discount) { one_plus_one_free }
      let(:product) { discount.product }

      it 'returns correct total_price after one_plus_one_free discount successfully' do
        new_total = (quantity - (quantity % 2)) / 2 * line_item.product.price

        expect(subject.call).to eq(new_total)
      end
    end

    context 'single discount: drop_product_price' do
      let(:discount) { drop_product_price }
      let(:product) { discount.product }

      it 'returns correct total_price after drop_product_price discount successfully' do
        expect(subject.call).to eq(quantity * drop_product_price.value)
      end
    end

    context 'single discount: drop_total_price' do
      let(:discount) { drop_total_price }
      let(:product) { discount.product }

      it 'returns correct total_price after drop_total_price discount successfull' do
        new_total = (quantity * price) * drop_total_price.value

        expect(subject.call).to eq(new_total.round(2))
      end
    end

    # drop_product_price has priority 1, so it will apply first
    context 'multiple discounts: one_plus_one_free + drop_product_price' do
      let(:discount) { one_plus_one_free }

      let(:drop_product_price_2) do
        new_discount = drop_product_price.dup
        new_discount.assign_attributes(product: one_plus_one_free.product, value: 2.72)
        new_discount.save

        new_discount
      end

      let(:product) { discount.product }

      it 'returns correct total_price after one_plus_one_free + drop_product_price discounts' do
        new_total = quantity * drop_product_price_2.value
        new_quantity = (quantity - (quantity % 2)) / 2
        new_total = (new_quantity / quantity.to_f) * new_total

        expect(subject.call).to eq(new_total)
      end

      # that was just an example of testing multiple discounts, can do more if needed
    end
  end
end
