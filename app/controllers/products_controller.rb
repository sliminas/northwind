# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    render html: cell(Product::Cell::Index, nil,
                      layout: Northwind::Cell::Layout)

  end
end
