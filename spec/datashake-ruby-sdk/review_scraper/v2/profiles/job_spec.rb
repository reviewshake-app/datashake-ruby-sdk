# frozen_string_literal: true

require "spec_helper"

RSpec.describe Datashake::ReviewScraper::V2::Profiles::Job do
  let(:client) do
    Datashake::ReviewScraper::V2.new(
      Datashake::ReviewScraper::Client.new(token: "abcdef")
    )
  end

  subject { described_class.new(client) }

  context "and url param is given" do
    it "returns 200" do
      VCR.use_cassette("v2/profiles/job") do
        response = subject
          .job_id(348534143)
          .fetch

        expect(response.job_id).to eq(348534143)
        expect(response.url).to eq("I-80 Towing & Service, 1209 S 3rd St, Laramie, WY 82070, USA")
        expect(response.place_id).to eq(nil)
        expect(response.status).to eq("complete")
        expect(response.last_crawl).to eq(Date.parse("2022-04-08"))
        expect(response.from_date).to be_nil
        expect(response.blocks).to be_nil
        expect(response.diff).to be_nil
        expect(response.credits_used).to eq(20)
        expect(response.created_at).to be_nil
      end
    end
  end
end
