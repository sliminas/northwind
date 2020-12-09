# frozen_string_literal: true

module Product::Cell
  class Index < Northwind::Cell::Base
    include Pagy::Frontend

    def products
      options[:products]
    end

    def pagy
      options[:pagy]
    end

    def pagination
      pagy_nav pagy
    end
  end
end
