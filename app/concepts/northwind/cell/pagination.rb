# frozen_string_literal: true

module Northwind::Cell
  class Pagination < Trailblazer::Cell
    include Pagy::Frontend

    alias pagy model
  end
end
