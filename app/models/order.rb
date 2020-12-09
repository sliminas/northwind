# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :shipper
  belongs_to :employee
end
