# frozen_string_literal: true

module Datashake
  module ReviewScraper
    class V2
      class Profiles
        class Add
          PATH = "api/v2/profiles/add"

          def initialize(version)
            @version = version
            @params = {}
          end

          def url(url)
            @params[:url] = url

            self
          end

          def query(query)
            @params[:query] = query

            self
          end

          def place_id(place_id)
            @params[:place_id] = place_id

            self
          end

          def from_date(date)
            @params[:from_date] = date

            self
          end

          def blocks(blocks)
            @params[:blocks] = blocks

            self
          end

          def diff(diff)
            @params[:diff] = diff

            self
          end

          def callback(callback)
            @params[:callback] = callback

            self
          end

          def external_identifier(id)
            @params[:external_identifier] = id

            self
          end

          def priority_job(bool)
            @params[:priority_job] = bool

            self
          end

          def force_crawl(bool)
            @params[:force_crawl] = bool

            self
          end

          def fetch
            response = version.fetch(method: :post, path: PATH, params: params)

            Datashake::ReviewScraper::V2::Response.new(response)
          end

          private

          attr_reader :version, :params
        end
      end
    end
  end
end
