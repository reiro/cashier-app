require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe 'validations' do
    let(:line_item) { build(:line_item) }

    it 'Creates a valid line_item' do
      expect(line_item).to be_valid
      expect(line_item.save).to be(true)
    end
  end

  describe '#final_line_price' do
    let(:product) { create(:product, product_code: 'new', name: 'new', price: '1.23') }
    let(:line_item) { create(:line_item, product: product, quantity: 8) }

    it 'returns final_line_price as quantity * product price' do
      expect(line_item.final_line_price).to eq(line_item.quantity * line_item.product.price)
    end
  end
end
