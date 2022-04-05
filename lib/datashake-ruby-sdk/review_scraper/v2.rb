# frozen_string_literal: true

module Datashake
  module ReviewScraper
    class V2
      autoload :Profiles, "datashake-ruby-sdk/review_scraper/v2/profiles"

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
