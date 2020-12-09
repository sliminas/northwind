# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :supervisor, class_name: "Employee", foreign_key: :reports_to
  has_many :orders
  has_and_belongs_to_many :territories
end
