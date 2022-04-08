# frozen_string_literal: true

require "dry-struct"

module Datashake
  module ReviewScraper
    class V2
      class JobInstance < ::Dry::Struct
        transform_keys(&:to_sym)

        attribute :job_id, Datashake::Types::Strict::Integer
        attribute :url, Datashake::Types::Strict::String
        attribute :place_id, Datashake::Types::Strict::String.optional
        attribute :status, Datashake::Types::Strict::String # Enum
        attribute :last_crawl, Datashake::Types::Params::Date
        attribute :from_date, Datashake::Types::Params::Date.optional
        attribute :blocks, Datashake::Types::Strict::Integer.optional
        attribute :diff, Datashake::Types::Strict::Integer.optional
        attribute :credits_used, Datashake::Types::Strict::Integer.optional
        attribute :created_at, Datashake::Types::Params::Date
      end
    end
  end
end
