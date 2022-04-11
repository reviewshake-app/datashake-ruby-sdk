# frozen_string_literal: true

require "dry-struct"

module Datashake
  module ReviewScraper
    class V2
      class ReviewResponseInstance < ::Dry::Struct
        transform_keys(&:to_sym)

        attribute :id, Datashake::Types::Strict::Integer
        attribute :name, Datashake::Types::Strict::String
        attribute :date, Datashake::Types::Params::Date
        attribute :comment, Datashake::Types::Strict::String.optional
      end
    end
  end
end
