# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    first_name     { Faker::Name.first_name }
    last_name      { Faker::Name.last_name }
    title          { Faker::Military.air_force_rank }
    date_of_birth  { Faker::Date.birthday(min_age: 18) }
    date_of_hiring { Faker::Date.birthday(max_age: 20) }

    notes { Faker::Lorem.paragraph }

    association :address, factory: :address
  end
end
