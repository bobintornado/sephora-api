# frozen_string_literal: true

# create some random seeds data
categories = Category.create([{ name: 'makeup' }, { name: 'tools' }, { name: 'brushes' }])

1000.times do |n|
  category = categories.sample
  under_sale = [true, false].sample
  sold_out = [true, false].sample
  name = "random item #{n}"

  price = rand(1000) + 20
  sale_price = price - 15

  Product.create!(name: name, price: price, sale_price: sale_price, under_sale: under_sale, sold_out: sold_out, category: category)
end
