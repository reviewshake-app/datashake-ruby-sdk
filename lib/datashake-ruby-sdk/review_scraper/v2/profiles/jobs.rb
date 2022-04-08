# frozen_string_literal: true

module Datashake
  module ReviewScraper
    class V2
      class Profiles
        class Jobs
          PATH = "api/v2/profiles/jobs"

          def initialize(version)
            @version = version
            @params = {}
          end

          def from_created_at(from_created_at)
            @params[:from_created_at] = from_created_at

            self
          end

          def crawl_status(crawl_status)
            @params[:crawl_status] = crawl_status

            self
          end

          def page(page)
            @params[:page] = page

            self
          end

          def per_page(per_page)
            @params[:per_page] = per_page

            self
          end

          def fetch
            response = version.connection.get(PATH) do |request|
              request.params = params
            end

            Datashake::ReviewScraper::V2::JobsInstance.new(response.body)
          end

          private

          attr_reader :version, :params
        end
      end
    end
  end
end
