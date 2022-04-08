# frozen_string_literal: true

require "dry-struct"

module Datashake
  module ReviewScraper
    class V2
      class Response < ::Dry::Struct
        transform_keys(&:to_sym)

        attribute :success, Datashake::Types::Strict::Bool
        attribute? :job_id, Datashake::Types::Strict::Integer
        attribute :status, Datashake::Types::Strict::Integer
        attribute :message, Datashake::Types::Strict::String
      end
    end
  end
end
