# frozen_string_literal: true

module Datashake
  module ReviewIndex
    class V1
      class Profiles < BaseEndpoint
        PATH = "profiles"

        allow_parameters %i[callback name domain ticker_symbol phone_number street city zip_code state country address page_number per_page update external_identifier]

        def endpoint_path
          PATH
        end
      end
    end
  end
end
