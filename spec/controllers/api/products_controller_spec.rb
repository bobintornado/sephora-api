# frozen_string_literal: true

require 'rails_helper'

describe Api::ProductsController, type: :controller do
  describe 'GET index' do
    it 'should return all products' do
      product = create(:product)
      get :index

      expect(assigns(:products)).to eq([product])
    end

    it 'should filter by min_price' do
      product = create(:product, sale_price: 70)
      create(:product, sale_price: 60)

      get :index, params: { min_price: 65 }

      expect(assigns(:products)).to eq([product])
    end

    it 'should filter by max_price' do
      create(:product, sale_price: 70)
      product = create(:product, sale_price: 60)

      get :index, params: { max_price: 65 }

      expect(assigns(:products)).to eq([product])
    end

    it 'should filter by category' do
      create(:product, sale_price: 70)
      product = create(:product, sale_price: 60, category: Category.create(name: 'new'))

      get :index, params: { categories: 'new' }

      expect(assigns(:products)).to eq([product])
    end

    it 'should return as asc order' do
      high = create(:product, sale_price: 70)
      low = create(:product, sale_price: 60)

      get :index, params: { order: 'asc' }

      expect(assigns(:products)).to eq([low, high])
    end

    it 'should return as desc order' do
      high = create(:product, sale_price: 70)
      low = create(:product, sale_price: 60)

      get :index

      expect(assigns(:products)).to eq([high, low])
    end

    it 'should use page size' do
      product = create(:product, sale_price: 70)
      create(:product, sale_price: 60)

      get :index, params: { per_page: 1 }

      expect(assigns(:products)).to eq([product])
    end
  end
end
