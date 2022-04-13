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

  context "and the job is not found" do
    it "throws an error" do
      VCR.use_cassette("v2/profiles/job_not_found") do
        expect { subject.job_id(3485341434638423).fetch }
          .to raise_error { |error|
            expect(error).to be_a(Datashake::ReviewScraper::V2::Error)
            expect(error.message).to eq("This job ID doesn't exist, please create it")
            expect(error.status).to eq(400)
          }
      end
    end
  end
end
