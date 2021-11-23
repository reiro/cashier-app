require 'rails_helper'

RSpec.describe Discounts::DropTotalPrice, type: :service do
  let(:price) { 2.22 }
  let(:quantity_condition) { 3 }
  let(:quantity) { quantity_condition }
  let(:discount_value) { 2 / BigDecimal(3) }

  let(:state) do
    { quantity: quantity, price: price, total: quantity * price }
  end

  subject { described_class.new(state, quantity_condition, discount_value) }

  describe '#call' do
    context 'quantity_condition match' do
      it 'returns state after implementing drop_total_price discount' do
        expect(subject.call[:total]).to be_within(0.01).of((state[:total] * discount_value).round(2))
      end
    end

    context 'quantity_condition does not match' do
      let(:quantity) { quantity_condition - 1 }

      it 'returns state after implementing drop_total_price discount' do
        expect(subject.call[:total]).to be(state[:total])
      end
    end
  end
end
