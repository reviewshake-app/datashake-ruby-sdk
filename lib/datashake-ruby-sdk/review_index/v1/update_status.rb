# frozen_string_literal: true

module Datashake
  module ReviewIndex
    class V1
      class UpdateStatus < BaseEndpoint
        PATH = "update/status"

        request_parameters [:request_id]

        def response_class
          Datashake::ReviewIndex::V1::StatusResponse
        end

        def endpoint_path
          PATH
        end
      end
    end
  end
end
