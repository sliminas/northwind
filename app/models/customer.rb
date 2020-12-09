# frozen_string_literal: true

class Customer < ApplicationRecord
  has_and_belongs_to_many :demographics, class_name: "Customer::Demographic"
  has_many :orders
end
