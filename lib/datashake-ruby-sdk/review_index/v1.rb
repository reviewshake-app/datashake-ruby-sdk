# frozen_string_literal: true

module Datashake
  module ReviewIndex
    class V1
      autoload :BaseEndpoint, "datashake-ruby-sdk/review_index/v1/base_endpoint"
      autoload :Error, "datashake-ruby-sdk/review_index/v1/error"
      autoload :Profiles, "datashake-ruby-sdk/review_index/v1/profiles"
      autoload :Response, "datashake-ruby-sdk/review_index/v1/response"
      autoload :StatusResponse, "datashake-ruby-sdk/review_index/v1/status_response"
      autoload :Reviews, "datashake-ruby-sdk/review_index/v1/reviews"
      autoload :UpdateStatus, "datashake-ruby-sdk/review_index/v1/update_status"

      def initialize(client)
        @client = client
      end

      def profiles
        @profiles ||= Profiles.new(self)
      end

      def reviews
        @reviews ||= Reviews.new(self)
      end

      def update_status
        @update_status ||= UpdateStatus.new(self)
      end

      def connection
        client.connection
      end

      def fetch(method:, path:, params: {}, body: {})
        response = connection.public_send(method, path) do |request|
          request.params = params
          request.params[:api_key] = client.token
          request.body = body.to_json
        end

        body = response.body
        body["http_status"] = response.status

        return body if body["success"] || success_status?(response.status)

        raise Datashake::ReviewIndex::V1::Error.new(
          body["message"],
          body["http_status"]
        )
      end

      def success_status?(status)
        [200, 201].include?(status)
      end

      private

      attr_reader :client
    end
  end
end
