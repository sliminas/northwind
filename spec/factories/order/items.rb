# frozen_string_literal: true

FactoryBot.define do
  factory :order_item, class: "Order::Item" do
    association :order, factory: :order
    association :product, factory: :product

    price    { Faker::Commerce.price range: 5..1000 }
    quantity { Faker::Number.between from: 1, to: 10 }
    discount { Faker::Commerce.price range: 1..4 }
  end
end
