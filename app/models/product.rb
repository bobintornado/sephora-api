# frozen_string_literal: true

# The Product model
class Product < ApplicationRecord
  belongs_to :category

  scope :in_categories, (lambda { |category_ids|
    where(category_id: category_ids) if category_ids.present?
  })

  scope :price_more_than, (lambda { |min_price|
    where('(under_sale=true AND sale_price >= ?) OR (under_sale=false AND price >= ?)',
          min_price, min_price)
  })

  scope :price_less_than, (lambda { |max_price|
    unless max_price.zero?
      where('(under_sale=true AND sale_price <= ?) OR (under_sale=false AND price <= ?)',
            max_price, max_price)
    end
  })
end
