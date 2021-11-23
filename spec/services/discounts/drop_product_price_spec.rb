require 'rails_helper'

RSpec.describe Discounts::DropProductPrice, type: :service do
  let(:price) { 12.45 }
  let(:quantity_condition) { 3 }
  let(:quantity) { quantity_condition }
  let(:new_price) { 4.5 }
  let(:discount_value) { new_price }

  let(:state) do
    { quantity: quantity, price: price, total: quantity * price }
  end

  subject { described_class.new(state, quantity_condition, discount_value) }

  describe '#call' do
    context 'quantity_condition match' do
      it 'returns state after implementing drop_product_price discount' do
        expect(subject.call[:price]).to be(new_price)
        expect(subject.call[:total]).to be(new_price * quantity)
      end
    end

    context 'quantity_condition does not match' do
      let(:quantity) { quantity_condition - 1 }

      it 'returns state after implementing drop_product_price discount' do
        expect(subject.call[:price]).to be(price)
        expect(subject.call[:total]).to be(price * quantity)
      end
    end
  end
end
