# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name              { Faker::Commerce.product_name }
    price             { Faker::Commerce.price }
    quantity_per_unit { Faker::Number.between from: 1, to: 50 }
    unit              { %w[bottles pieces meters square\ meters liters cups].sample }
    stock             { Faker::Number.between from: 1, to: 1_000_000 }
  end
end
