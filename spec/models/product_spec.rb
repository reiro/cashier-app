require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { build(:product, :gr1) }

  describe 'validations' do
    it 'Creates a valid product' do
      expect(product).to be_valid
      expect(product.save).to be(true)
    end

    context 'invalid params' do
      let(:invalid_params) { { product_code: product.product_code, name: 'duplicates product_code', price: 1.0 } }

      it 'Fails validation with same product_code' do
        product.save

        expect do
          new_product = Product.new(invalid_params)

          expect(new_product).to_not be_valid
          expect(new_product.save).to be(false)
        end.to change(Product, :count).by(0)
      end
    end
  end
end
