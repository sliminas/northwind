# frozen_string_literal: true

FactoryBot.define do
  factory :shipper do
    name { Faker::Company.name }

    association :address, factory: :address
  end
end
