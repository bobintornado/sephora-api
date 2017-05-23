# frozen_string_literal: true

class Api::ProductsController < ApplicationController
  def index
    defaults = { min_price: 0, max_price: 0, order: :desc, page: 0, per_page: 100 }
    query_params = defaults.merge(filter_params)

    page_size = query_params[:per_page].to_i
    offset = query_params[:page].to_i * page_size
    order = query_params[:order].to_sym
    max_price = query_params[:max_price].to_i
    min_price = query_params[:min_price].to_i

    total_count = Product.in_categories(category_ids).price_more_than(min_price).price_less_than(max_price)
                         .order(price: order).count

    @products = Product.in_categories(category_ids).price_more_than(min_price).price_less_than(max_price)
                       .order(price: order).limit(page_size).offset(offset).eager_load(:category)

    render json: @products, meta: { total: total_count }
  end

  def show
    @product = Product.find params[:id]

    render json: @product
  end

  private

  def filter_params
    params.permit(:min_price, :max_price, :order, :page, :per_page).to_h.symbolize_keys
  end

  def category_ids
    return [] if params[:categories].nil?
    Category.where(name: params[:categories].split(',')).ids
  end
end
