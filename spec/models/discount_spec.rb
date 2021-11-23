require 'rails_helper'

RSpec.describe Discount, type: :model do
  let(:discount) { build(:discount) }

  describe 'validations' do
    it 'Creates a valid discount' do
      expect(discount).to be_valid
      expect(discount.save).to be(true)
    end

    context 'invalid params' do
      let(:invalid_params) { { name: nil, priority: nil, quantity_condition: nil, product: nil } }

      it 'Fails validations with invalid params' do
        expect do
          new_discount = Discount.new(invalid_params)

          expect(new_discount).to_not be_valid
          expect(new_discount.save).to be(false)
          expect(new_discount.errors).to include(:name)
          expect(new_discount.errors).to include(:priority)
          expect(new_discount.errors).to include(:quantity_condition)
          expect(new_discount.errors).to include(:product)
        end.to change(Discount, :count).by(0)
      end
    end
  end
end
