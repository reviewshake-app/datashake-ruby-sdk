# frozen_string_literal: true

require "faraday"

module Datashake
  module ReviewScraper
    class Client
      BASE_URL = "https://app.datashake.com"

      def initialize(token:, adapter: Faraday.default_adapter)
        @token = token
        @adapter = adapter
      end

      def connection
        @connection ||= Faraday.new do |conn|
          conn.headers = {"spiderman-token" => token}
          conn.url_prefix = BASE_URL
          conn.request(:json)
          conn.response(:json, content_type: "application/json")
          conn.adapter(adapter)
        end
      end

      def v2
        @v2 ||= V2.new(self)
      end

      def profiles
        v2.profiles
      end

      def add_profile
        v2.profiles.add
      end

      def jobs
        v2.profiles.jobs
      end

      def info(job_id)
        v2.profiles.info.job_id(job_id)
      end

      private

      attr_reader :token, :adapter
    end
  end
end
