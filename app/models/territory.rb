# frozen_string_literal: true

class Territory < ApplicationRecord
  belongs_to :region
end
