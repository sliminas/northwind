# frozen_string_literal: true

class Product < ApplicationRecord
  include PgSearch::Model

  belongs_to :category, optional: true
  belongs_to :supplier, optional: true

  pg_search_scope :search_by_name,
                  against: :name,
                  using:   {
                    tsearch: {
                      prefix:          true,
                      any_word:        true,
                      dictionary:      "english",
                      tsvector_column: :text_search_vector,
                      highlight:       {
                        StartSel:          "<b>",
                        StopSel:           "</b>",
                        MaxFragments:      3,
                        FragmentDelimiter: "&hellip;"
                      }
                    },
                    trigram: {}
                  }
end
