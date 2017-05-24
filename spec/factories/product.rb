# frozen_string_literal: true

FactoryGirl.define do
  factory :product do
    name 'factory product'
    sold_out true
    under_sale true
    price 100
    sale_price 80

    category { Category.first || FactoryGirl.create(:category) }
  end
end
