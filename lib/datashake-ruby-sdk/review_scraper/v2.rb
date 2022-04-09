# frozen_string_literal: true

module Datashake
  module ReviewScraper
    class V2
      autoload :Profiles, "datashake-ruby-sdk/review_scraper/v2/profiles"
      autoload :Response, "datashake-ruby-sdk/review_scraper/v2/response"
      autoload :BulkResponse, "datashake-ruby-sdk/review_scraper/v2/bulk_response"
      autoload :JobInstance, "datashake-ruby-sdk/review_scraper/v2/job_instance"
      autoload :JobsInstance, "datashake-ruby-sdk/review_scraper/v2/jobs_instance"
      autoload :ProfileInstance, "datashake-ruby-sdk/review_scraper/v2/profile_instance"
      autoload :ReviewInstance, "datashake-ruby-sdk/review_scraper/v2/review_instance"

      def initialize(client)
        @client = client
      end

      def profiles
        @profiles ||= Profiles.new(self)
      end

      def connection
        client.connection
      end

      private

      attr_reader :client
    end
  end
end
