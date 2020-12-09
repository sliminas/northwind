# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    contact_name  { Faker::Address.name }
    contact_title { Faker::Military.air_force_rank }
    company_name  { Faker::Company.name }

    street  { Faker::Address.street_address }
    zip     { Faker::Address.zip }
    city    { Faker::Address.city }
    country { Faker::Address.country }
    phone   { Faker::PhoneNumber.phone_number_with_country_code }
  end
end
