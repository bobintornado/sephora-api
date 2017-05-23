class ProductSerializer < ActiveModel::Serializer
  attributes :name, :sold_out, :under_sale, :price, :sale_price, :category

  belongs_to :category

  def category
    object.category.name
  end
end
