# frozen_string_literal: true

require "dry-struct"

module Datashake
  module ReviewScraper
    class V2
      class ReviewInstance < ::Dry::Struct
        transform_keys(&:to_sym)

        attribute :id, Datashake::Types::Strict::Integer
        attribute :name, Datashake::Types::Strict::String
        attribute :date, Datashake::Types::Params::Date
        attribute :rating_value, Datashake::Types::Strict::Float
        attribute :review_text, Datashake::Types::Strict::String.optional
        attribute :url, Datashake::Types::Strict::String
        attribute :profile_picture, Datashake::Types::Strict::String.optional
        attribute :location, Datashake::Types::Strict::String.optional
        attribute :review_title, Datashake::Types::Strict::String.optional
        attribute :verified_order, Datashake::Types::Strict::Bool
        attribute :language_code, Datashake::Types::Strict::String.optional
        attribute :reviewer_title, Datashake::Types::Strict::String.optional
        attribute :unique_id, Datashake::Types::Strict::String
        attribute :meta_data, Datashake::Types::Metadata.optional
        attribute? :response, Datashake::ReviewScraper::V2::ReviewResponseInstance
      end
    end
  end
end
