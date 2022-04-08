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
            response = version.connection.get("#{PATH}/#{params[:job_id]}")

            Datashake::ReviewScraper::V2::JobInstance.new(response.body)
          end

          private

          attr_reader :version, :params
        end
      end
    end
  end
end
