# frozen_string_literal: true

class Customer::Demographic < ApplicationRecord
  has_and_belongs_to_many :customers
end
