# frozen_string_literal: true

module Product::Cell
  class Show < Northwind::Cell::Base
    alias product model
  end
end
