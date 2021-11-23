class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :discounts, dependent: :destroy

  validates :product_code, presence: true, uniqueness: true
end
