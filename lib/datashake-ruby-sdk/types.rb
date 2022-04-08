# frozen_string_literal: true

require "dry-struct"

module Datashake
  module Types
    include Dry.Types()

    Metadata = Types.Constructor(Hash) { |json| ::JSON.parse(json) }
  end
end
