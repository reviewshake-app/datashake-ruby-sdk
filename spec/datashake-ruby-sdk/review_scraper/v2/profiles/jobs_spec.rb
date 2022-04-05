# frozen_string_literal: true

require "spec_helper"

RSpec.describe Datashake::ReviewScraper::V2::Profiles::Jobs do
  let(:client) { Datashake::ReviewScraper::Client.new(token: "abcdef") }

  subject { described_class.new(client) }

  context "and url param is given" do
    it "returns 200" do
      VCR.use_cassette("v2/profiles/jobs_with_options") do
        response = subject
          .from_created_at("2022-01-01")
          .crawl_status("complete")
          .page(2)
          .per_page(2)
          .fetch

        expect(response).to eq(
          {
            jobs: [
              {
                "job_id" => 346_998_013,
                "url" => "https://www.amazon.com/dp/B003YH9MMI",
                "place_id" => nil,
                "status" => "complete",
                "last_crawl" => "2022-04-05",
                "from_date" => nil,
                "blocks" => nil,
                "diff" => nil,
                "credits_used" => 138,
                "created_at" => "2022-04-05"
              }
            ],
            total: 3,
            per_page: 2,
            page: 2
          }
        )
      end
    end
  end
end
