# frozen_string_literal: true

class Api::ProductsController < Api::BaseController
  def index
    products = Product.search_by_name(params[:search]).with_pg_search_highlight.limit(10)

    render json: products.map { |product| { name: product.pg_search_highlight, id: product.id } }
  end
end
