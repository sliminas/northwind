# frozen_string_literal: true

FactoryBot.define do
  factory :supplier do
    name { Faker::Company.name }
    website_url { Faker::Internet.url }
  end
end
