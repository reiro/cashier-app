require 'rails_helper'

RSpec.describe Discounts::OnePlusOneFree, type: :service do
  let(:price) { 2.5 }
  let(:quantity_condition) { 2 }
  let(:quantity) { quantity_condition }
  let(:discount_value) { nil }

  let(:state) do
    { quantity: quantity, price: price, total: quantity * price }
  end

  subject { described_class.new(state, quantity_condition, discount_value) }

  describe '#call' do
    context 'quantity_condition match' do
      let(:new_quantity) { (quantity - (quantity % 2)) / 2 }

      it 'returns state after implementing one_plus_one_free discount' do
        expect(subject.call[:quantity]).to be(new_quantity)
        expect(subject.call[:total]).to be(price * new_quantity)
      end
    end

    context 'quantity_condition does not match' do
      let(:quantity) { quantity_condition - 1 }

      it 'returns state after implementing one_plus_one_free discount' do
        expect(subject.call[:quantity]).to be(quantity)
        expect(subject.call[:total]).to be(price * quantity)
      end
    end
  end
end
