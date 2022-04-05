# frozen_string_literal: true

require "spec_helper"

RSpec.describe Datashake::ReviewScraper::V2::Profiles::Info do
  let(:client) { Datashake::ReviewScraper::Client.new(token: "abcdef") }

  subject { described_class.new(client) }

  context "and url param is given" do
    it "returns 200" do
      VCR.use_cassette("v2/profiles/info") do
        response = subject
          .job_id(346_998_013)
          .fetch

        expect(response).to eq(
          {
            success: true,
            status: 200,
            job_id: 346998013,
            source_url: "https://www.amazon.com/dp/B003YH9MMI",
            source_name: "amazon",
            place_id: nil,
            external_identifier: nil,
            meta_data: "{\"star_ratings\":{\"1star\":\"1%\",\"2star\":\"4%\",\"3star\":\"7%\",\"4star\":\"27%\",\"5star\":\"61%\"}}",
            unique_id: nil,
            review_count: 214,
            average_rating: 4.4,
            last_crawl: "2022-04-05",
            crawl_status: "complete",
            percentage_complete: 100,
            result_count: 130,
            credits_used: 138,
            from_date: nil,
            blocks: nil
          }
        )
      end
    end
  end
end
