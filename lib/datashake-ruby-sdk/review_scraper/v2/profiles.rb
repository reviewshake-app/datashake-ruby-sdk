# frozen_string_literal: true

module Datashake
  module ReviewScraper
    class V2
      class Profiles
        autoload :Add, "datashake-ruby-sdk/review_scraper/v2/profiles/add"
        autoload :AddBulk, "datashake-ruby-sdk/review_scraper/v2/profiles/add_bulk"
        autoload :Jobs, "datashake-ruby-sdk/review_scraper/v2/profiles/jobs"
        autoload :Info, "datashake-ruby-sdk/review_scraper/v2/profiles/info"

        def initialize(version)
          @version = version
        end

        def add
          Add.new(version)
        end

        def jobs
          Jobs.new(version)
        end

        def info
          Info.new(version)
        end

        private

        attr_reader :version
      end
    end
  end
end
