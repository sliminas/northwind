# frozen_string_literal: true

class Order::Item < ApplicationRecord
  belongs_to :order
  belongs_to :product
end
