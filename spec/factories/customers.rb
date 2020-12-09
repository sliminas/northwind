# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email }

    association :address, factory: :address
  end
end
