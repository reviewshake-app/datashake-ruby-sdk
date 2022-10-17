# frozen_string_literal: true

module Datashake
  module ReviewIndex
    class V1
      class Reviews < BaseEndpoint
        PATH = "reviews"

        allow_parameters %i[callback name domain ticker_symbol phone_number street city zip_code state country address review_site diff page_number per_page from_date to_date timeseries update external_identifier]

        def endpoint_path
          PATH
        end
      end
    end
  end
end
