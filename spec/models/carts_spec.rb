require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart_1) { create :cart, :with_products_1 }
  let(:cart_2) { create :cart, :with_products_2 }
  let(:cart_3) { create :cart, :with_products_3 }
  let(:cart_4) { create :cart, :with_products_4 }
  let(:empty_cart) { create(:cart) }

  describe '#total_price' do
    context 'from empty cart' do
      let(:cart) { empty_cart }
      let(:line_items) { create_list(:line_item, 2) }

      before do
        line_items.each { |li| cart.line_items << li }
      end

      it 'returns total_price of all line_items' do
        expect(cart.total_price).to eq(line_items.sum(&:final_line_price))
      end
    end

    context 'GR1,SR1,GR1,GR1,CF1' do
      let(:cart) { cart_1 }

      it 'returns total_price 22.45' do
        expect(cart.total_price).to eq(22.45)
      end
    end

    context 'GR1,GR1' do
      let(:cart) { cart_2 }

      it 'returns total_price 3.11' do
        expect(cart.total_price).to eq(3.11)
      end
    end

    context 'SR1,SR1,GR1,SR1' do
      let(:cart) { cart_3 }

      it 'returns total_price 16.61' do
        expect(cart.total_price).to eq(16.61)
      end
    end

    context 'GR1,CF1,SR1,CF1,CF1' do
      let(:cart) { cart_4 }

      it 'returns total_price 30.57' do
        expect(cart.total_price).to eq(30.57)
      end
    end
  end
end
