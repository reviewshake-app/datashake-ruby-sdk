# frozen_string_literal: true

module Datashake
  module ReviewScraper
    class V2
      autoload :Error, "datashake-ruby-sdk/review_scraper/v2/error"
      autoload :Profiles, "datashake-ruby-sdk/review_scraper/v2/profiles"
      autoload :Response, "datashake-ruby-sdk/review_scraper/v2/response"
      autoload :BulkResponse, "datashake-ruby-sdk/review_scraper/v2/bulk_response"
      autoload :JobInstance, "datashake-ruby-sdk/review_scraper/v2/job_instance"
      autoload :JobsInstance, "datashake-ruby-sdk/review_scraper/v2/jobs_instance"
      autoload :ProfileInstance, "datashake-ruby-sdk/review_scraper/v2/profile_instance"
      autoload :ReviewInstance, "datashake-ruby-sdk/review_scraper/v2/review_instance"
      autoload :ReviewResponseInstance, "datashake-ruby-sdk/review_scraper/v2/review_response_instance"

      def initialize(client)
        @client = client
      end

      def profiles
        @profiles ||= Profiles.new(self)
      end

      def connection
        client.connection
      end

      def fetch(method:, path:, params: {}, body: {})
        response = connection.public_send(method, path) do |request|
          request.params = params
          request.body = body.to_json
        end

        body = response.body

        raise Datashake::ReviewScraper::V2::Error.new("Server error", response.status) if response.status >= 500

        return body if body.is_a?(Array)
        return body if body["status"].is_a?(String)
        return body if body["jobs"]
        return body if body["status"] == 200

        raise Datashake::ReviewScraper::V2::Error.new(
          body["message"],
          body.fetch("status", response.status)
        )
      end

      private

      attr_reader :client
    end
  end
end
