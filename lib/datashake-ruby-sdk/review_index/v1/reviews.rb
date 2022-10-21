# frozen_string_literal: true

module Datashake
  module ReviewIndex
    class V1
      class Reviews < BaseEndpoint
        PATH = "reviews"

        request_parameters %i[
          address
          callback
          city
          country
          diff
          domain
          external_identifier
          from_date
          name
          page_number
          per_page
          phone_number
          review_site
          state
          street
          ticker_symbol
          timeseries
          to_date
          update
          zip_code
        ]

        def response_class
          Datashake::ReviewIndex::V1::Response
        end

        def endpoint_path
          PATH
        end
      end
    end
  end
end
