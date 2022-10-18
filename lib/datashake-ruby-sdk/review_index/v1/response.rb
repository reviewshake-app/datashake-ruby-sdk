# frozen_string_literal: true

require "dry-struct"

module Datashake
  module ReviewIndex
    class V1
      class Response < ::Dry::Struct
        transform_keys(&:to_sym)

        attribute :success, Datashake::Types::Strict::Bool
        attribute? :request_id, Datashake::Types::Strict::String
        attribute :status, Datashake::Types::Strict::Integer
        attribute :message, Datashake::Types::Strict::String
        attribute? :credits_used, Datashake::Types::Strict::Integer
        attribute? :details, Datashake::Types::Strict::String
      end
    end
  end
end
