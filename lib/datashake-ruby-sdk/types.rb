# frozen_string_literal: true

require "dry-struct"

module Datashake
  module Types
    include Dry.Types()

    Metadata = Types.Constructor(Hash) { |json| ::JSON.parse(json) }
    ReviewCollection = Types::Array.of(Datashake::ReviewScraper::V2::ReviewInstance)
  end
end
