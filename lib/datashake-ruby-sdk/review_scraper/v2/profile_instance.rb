# frozen_string_literal: true

require "dry-struct"

module Datashake
  module ReviewScraper
    class V2
      class ProfileInstance < ::Dry::Struct
        transform_keys(&:to_sym)

        attribute :success, Datashake::Types::Strict::Bool
        attribute :status, Datashake::Types::Strict::Integer
        attribute :job_id, Datashake::Types::Strict::Integer
        attribute :source_url, Datashake::Types::Strict::String
        attribute :source_name, Datashake::Types::Strict::String
        attribute :place_id, Datashake::Types::Strict::String.optional
        attribute :external_identifier, Datashake::Types::Strict::String.optional
        attribute :meta_data, Datashake::Types::Metadata.optional
        attribute :unique_id, Datashake::Types::Strict::String.optional
        attribute :review_count, Datashake::Types::Strict::Integer.optional
        attribute :average_rating, Datashake::Types::Strict::Float.optional
        attribute :last_crawl, Datashake::Types::Params::Date.optional
        attribute :crawl_status, Datashake::Types::Strict::String
        attribute :percentage_complete, Datashake::Types::Coercible::Integer
        attribute :result_count, Datashake::Types::Strict::Integer
        attribute :credits_used, Datashake::Types::Strict::Integer
        attribute :from_date, Datashake::Types::Params::Date.optional
        attribute :blocks, Datashake::Types::Strict::Integer.optional
        attribute? :reviews, Datashake::Types::ReviewCollection
      end
    end
  end
end
