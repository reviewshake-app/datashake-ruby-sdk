# frozen_string_literal: true

require "dry-struct"

module Datashake
  module ReviewScraper
    class V2
      class BulkResponse < ::Dry::Struct
        transform_keys(&:to_sym)

        attribute :success, Datashake::Types::Strict::Bool
        attribute :job_id, Datashake::Types::Strict::String
        attribute :status, Datashake::Types::Strict::Integer
        attribute :message, Datashake::Types::Strict::String

        attribute? :from_date, Datashake::Types::Params::Date.optional
        attribute? :blocks, Datashake::Types::Params::Integer.optional
        attribute? :diff, Datashake::Types::Strict::Integer.optional
        attribute? :callback, Datashake::Types::Strict::String.optional
      end
    end
  end
end
