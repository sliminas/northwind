# frozen_string_literal: true

module Product::Cell
  class Index < Northwind::Cell::Base

    def products
      options[:products]
    end

    def pagy
      options[:pagy]
    end

    def pagination
      cell Northwind::Cell::Pagination, pagy
    end
  end
end
