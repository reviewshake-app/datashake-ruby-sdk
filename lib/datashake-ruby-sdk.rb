# frozen_string_literal: true

require_relative "datashake-ruby-sdk/version"

module Datashake
  autoload :ReviewScraper, "datashake-ruby-sdk/review_scraper"
  autoload :Types, "datashake-ruby-sdk/types"

  class Error < StandardError; end
end
