# frozen_string_literal: true

require "dry-struct"

module Datashake
  module ReviewScraper
    class V2
      class JobsInstance < ::Dry::Struct
        transform_keys(&:to_sym)

        attribute :jobs, Types::Array.of(Datashake::ReviewScraper::V2::JobInstance)
        attribute :total, Datashake::Types::Strict::Integer
        attribute :per_page, Datashake::Types::Strict::Integer
        attribute :page, Datashake::Types::Strict::Integer
      end
    end
  end
end
