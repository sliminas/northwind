# frozen_string_literal: true

namespace :db do
  task :seed do
    require_relative "../../db/seeds"
    Seeds.create_development_data
  end
end
