# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { Faker::Company.industry }
    description { Faker::Hipster.sentence }
  end
end
