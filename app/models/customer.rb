# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy

  has_one :address, as: :addressable, dependent: :destroy
end
