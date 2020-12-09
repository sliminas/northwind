# frozen_string_literal: true

require "rails_helper"

require_relative "../db/seeds"

describe Seeds do
  describe ".create_development_data" do
    it "succeeds" do
      described_class.create_development_data 2

      expect(Supplier.count).to eq 2
      expect(Shipper.count).to  eq 2
      expect(Category.count).to eq 2

      expect(Customer.count).to eq 2
      expect(Employee.count).to eq 2

      expect(Product.count).to eq 2
      expect(Order.count).to   eq 2
    end
  end
end
