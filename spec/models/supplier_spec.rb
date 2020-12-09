# frozen_string_literal: true

require "rails_helper"

describe Supplier do
  it "is new" do
    expect(build(:supplier).name).to be_instance_of String
  end
end
