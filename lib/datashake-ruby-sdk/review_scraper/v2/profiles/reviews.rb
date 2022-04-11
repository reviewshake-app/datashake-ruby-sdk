# frozen_string_literal: true

module Datashake
  module ReviewScraper
    class V2
      class Profiles
        class Reviews
          PATH = "api/v2/profiles/reviews"

          def initialize(version)
            @version = version
            @params = {}
          end

          def job_id(job_id)
            @params[:job_id] = job_id

            self
          end

          def from_date(from_date)
            @params[:from_date] = from_date

            self
          end

          def language_code(language_code)
            @params[:language_code] = language_code

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

          def allow_response(allow_response)
            @params[:allow_response] = allow_response

            self
          end

          def fetch
            response = version.fetch(method: :get, path: PATH, params: params)

            Datashake::ReviewScraper::V2::ProfileInstance.new(response)
          end

          private

          attr_reader :version, :params
        end
      end
    end
  end
end
