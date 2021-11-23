class Discount < ApplicationRecord
  belongs_to :product

  validates :name, :priority, :quantity_condition, presence: true

  # e.g. Discounts::OnePlusOneFree
  def service_class_name
    "Discounts::#{name}".constantize
  end
end
