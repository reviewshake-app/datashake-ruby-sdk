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
