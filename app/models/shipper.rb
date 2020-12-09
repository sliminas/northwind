# frozen_string_literal: true

class Shipper < ApplicationRecord
  has_one :address, as: :addressable, dependent: :destroy

  has_many :orders, dependent: :restrict_with_error
end
