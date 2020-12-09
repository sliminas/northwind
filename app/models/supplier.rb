# frozen_string_literal: true

class Supplier < ApplicationRecord
  has_many :products, dependent: :delete_all

  has_one :address, as: :addressable, dependent: :destroy
end
