# frozen_string_literal: true

require "rails_helper"

describe Product do
  describe "#search_by_name" do
    it "succeeds" do
      shirt = described_class.create! name: "Synergistic Bronzer Shirt"
      chair = described_class.create! name: "Enormous Cotton Chair"
      bag = described_class.create! name: "Practical Wooden Bag"
      glas = described_class.create! name: "Enormous Wooden glas"
      table = described_class.create! name: "Enourmous cotton Table monzer"

      expect(described_class.search_by_name("enor")).to match_array [chair, table, glas]
      expect(described_class.search_by_name("wood")).to match_array [bag, glas]
      expect(described_class.search_by_name("onzer")).to match_array [shirt, table]

      expect(described_class.search_by_name("enor woode")).to match_array [glas, bag, chair]
    end
  end
end
