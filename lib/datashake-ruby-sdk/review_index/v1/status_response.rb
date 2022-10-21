# frozen_string_literal: true

require "dry-struct"

module Datashake
  module ReviewIndex
    class V1
      class StatusResponse < ::Dry::Struct
        transform_keys(&:to_sym)

        attribute :request_id, Datashake::Types::Strict::String
        attribute :http_status, Datashake::Types::Strict::Integer
        attribute :status, Datashake::Types::Strict::String
        attribute :created_at, Datashake::Types::Strict::String
        attribute :completeness_rate, Datashake::Types::Strict::Float
        attribute :success_rate, Datashake::Types::Strict::Float
        attribute :size, Datashake::Types::Strict::Integer
      end
    end
  end
end
