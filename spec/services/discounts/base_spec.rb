require 'rails_helper'

RSpec.describe Discounts::Base, type: :service do
  let(:state) { {} }
  let(:quantity_condition) { 1 }
  let(:discount_value) { nil }
  subject { described_class.new(state, quantity_condition, discount_value) }

  describe '#call' do
    it 'raises an exception' do
      expect { subject.call }.to raise_error(StandardError, 'This method should not be call directly from Base service')
    end
  end
end
