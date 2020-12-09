# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    transient do
      base_time { Faker::Time.between from: 2.years.ago, to: 1.week.ago }
    end

    ordered_at { base_time }
    shipped_at { base_time + rand(6 * 24).hours }

    association :employee, factory: :employee
    association :customer, factory: :customer
    association :shipper,  factory: :shipper
  end
end
