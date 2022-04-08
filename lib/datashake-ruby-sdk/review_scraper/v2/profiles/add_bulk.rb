# frozen_string_literal: true

module Datashake
  module ReviewScraper
    class V2
      class Profiles
        class AddBulk
          PATH = "api/v2/profiles/add_bulk"

          def initialize(version)
            @version = version
            @body = {}
          end

          def payload(ary)
            @body = ary

            self
          end

          def fetch
            response = version.connection.post(PATH) do |request|
              request.body = body.to_json
            end

            response.body.map do |item|
              Datashake::ReviewScraper::V2::BulkResponse.new(item)
            end
          end

          private

          attr_reader :version, :body
        end
      end
    end
  end
end
