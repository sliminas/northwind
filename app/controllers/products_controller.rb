# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    pagination, products = pagy Product.all
    render_cell products: products,
                pagy:     pagination
  end

  def show
    @model = Product.find params[:id]
    render_cell
  end

  private

  def render_cell(model: @model, **options)
    options[:layout] ||= Northwind::Cell::Layout

    render html: concept("#{concept_name}/cell/#{action_name}", model, **options)
  end

  def concept_name
    self.class.name.sub(/Controller$/, "").singularize.underscore
  end
end
