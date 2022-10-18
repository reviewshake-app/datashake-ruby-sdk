# frozen_string_literal: true

module Datashake
  module ReviewIndex
    class V1
      class Profiles < BaseEndpoint
        PATH = "profiles"

        allow_parameters %i[
          address
          callback
          city
          country
          domain
          external_identifier
          name
          page_number
          per_page
          phone_number
          state
          street
          ticker_symbol
          update
          zip_code
        ]

        def endpoint_path
          PATH
        end
      end
    end
  end
end
