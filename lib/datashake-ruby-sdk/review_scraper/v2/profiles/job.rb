# frozen_string_literal: true

module Datashake
  module ReviewScraper
    class V2
      class Profiles
        class Job
          PATH = "api/v2/profiles/jobs"

          def initialize(version)
            @version = version
            @params = {}
          end

          def job_id(job_id)
            @params[:job_id] = job_id

            self
          end

          def fetch
            path = "#{PATH}/#{params[:job_id]}"
            response = version.fetch(method: :get, path: path)

            Datashake::ReviewScraper::V2::JobInstance.new(response.body)
          end

          private

          attr_reader :version, :params
        end
      end
    end
  end
end
