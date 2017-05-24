# frozen_string_literal: true

require 'rails_helper'

describe ProductSerializer do
  subject do
    ActiveModelSerializers::Adapter.create(product_serializer)
  end

  it 'includes the expected attributes' do
    expect(subject_json(subject)['data']['attributes'].keys)
      .to contain_exactly(
        'name', 'sold-out', 'under-sale', 'price', 'sale-price', 'category'
      )
  end

  it 'includes the related Resources' do
    expect(subject_json(subject)['data']['relationships'].keys)
      .to contain_exactly(
        'category'
      )
  end

  def subject_json(subject)
    JSON.parse(subject.to_json)
  end

  def product_resource
    @product_resource ||= create(:product)
  end

  def product_serializer
    @product_serializer ||=
      ProductSerializer.new(product_resource)
  end
end
