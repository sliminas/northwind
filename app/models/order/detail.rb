# frozen_string_literal: true

class Order::Detail < ApplicationRecord
  belongs_to :order
  belongs_to :product
end
