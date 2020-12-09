# frozen_string_literal: true

FactoryBot.define do
  factory :shipper do
    company_name { Faker::Company.name }
    phone { Faker::PhoneNumber.phone_number_with_country_code }

    association :address, factory: :address
  end
end
