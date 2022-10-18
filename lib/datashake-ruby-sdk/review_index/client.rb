# frozen_string_literal: true

require "faraday"

module Datashake
  module ReviewIndex
    class Client
      BASE_URL = "https://reviewindexapi.datashake.com"

      attr_reader :token

      def initialize(token:, adapter: Faraday.default_adapter, timeout: 30, open_timeout: 30)
        @token = token
        @adapter = adapter
        @timeout = timeout
        @open_timeout = open_timeout
      end

      def connection
        @connection ||= Faraday.new do |conn|
          conn.url_prefix = BASE_URL
          conn.request(:json)
          conn.response(:json, content_type: "application/json")
          conn.options.timeout = timeout
          conn.options.open_timeout = open_timeout
          conn.adapter(adapter)
        end
      end

      def v1
        @v1 ||= V1.new(self)
      end

      def profiles
        v1.profiles
      end

      def reviews
        v1.reviews
      end

      private

      attr_reader :adapter, :timeout, :open_timeout
    end
  end
end
