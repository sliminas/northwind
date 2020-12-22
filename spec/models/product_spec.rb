# frozen_string_literal: true

require "rails_helper"

describe Product do
  describe "#search_by_name" do
    it "succeeds" do
      shirt = described_class.create! name: "Synergistic Bronzer Shirt"
      chair = described_class.create! name: "Enormous Cotton Chair"
      bag = described_class.create! name: "Practical Wooden Bag"
      glas = described_class.create! name: "Enormous Wooden glas"
      table = described_class.create! name: "Enormous cotton Table Bronzer"

      expect(described_class.search_by_name("enor").pluck(:name)).to match_array [chair, table, glas].map(&:name)
      expect(described_class.search_by_name("wood").pluck(:name)).to match_array [bag, glas].map(&:name)
      expect(described_class.search_by_name("bron").pluck(:name)).to match_array [shirt, table].map(&:name)

      expect(described_class.search_by_name("enor woode").pluck(:name))
        .to match_array [glas, bag, chair, table].map(&:name)

      expect(described_class.search_by_name("Synergistic").pluck(:name)).to match_array [shirt].map(&:name)
      expect(described_class.search_by_name("shirt").pluck(:name)).to match_array [shirt].map(&:name)
    end
  end
end
