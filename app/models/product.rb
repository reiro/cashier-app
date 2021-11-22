class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :discounts, dependent: :destroy
end
