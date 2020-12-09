# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :supervisor, class_name: "Employee", optional: true

  has_many :orders, dependent: :nullify

  has_one :address, as: :addressable, dependent: :destroy
end
