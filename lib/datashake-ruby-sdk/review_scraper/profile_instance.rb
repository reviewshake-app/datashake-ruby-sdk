# frozen_string_literal: true

module Datashake
  module ReviewScraper
    include Datashake::Types

    class ProfileInstance < ::Dry::Struct
      attribute :job_id, Types::Strict::Integer
      attribute :source_url, Types::Strict::String
      attribute :source_name, Types::Strict::String

      attribute :place_id, Types::Strict::String.optional
    end
  end
end
