# frozen_string_literal: true

module Datashake
  module ReviewScraper
    class V2
      class Profiles
        class Info
          PATH = "api/v2/profiles/info"

          def initialize(version)
            @version = version
            @params = {}
          end

          def job_id(job_id)
            @params[:job_id] = job_id

            self
          end

          def fetch
            response = version.connection.get(PATH) do |request|
              request.params = params
            end

            response.body.transform_keys(&:to_sym)
          end

          private

          attr_reader :version, :params
        end
      end
    end
  end
end
