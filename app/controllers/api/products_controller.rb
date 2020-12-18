# frozen_string_literal: true

class Api::ProductsController < Api::BaseController
  def index
    _pagination, products = pagy Product.search_by_name(params[:search]), items: 10

    render json: products
  end
end
