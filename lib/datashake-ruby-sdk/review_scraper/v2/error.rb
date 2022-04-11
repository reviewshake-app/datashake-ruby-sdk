# frozen_string_literal: true

module Datashake
  module ReviewScraper
    class V2
      class Error < StandardError
        attr_reader :status

        def initialize(msg, status)
          @status = status

          super(msg)
        end
      end
    end
  end
end
