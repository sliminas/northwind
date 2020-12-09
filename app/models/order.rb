# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :shipper
  belongs_to :employee

  has_many :items, class_name: "Order::Item", dependent: :delete_all
end
