# frozen_string_literal: true

require "spec_helper"

RSpec.describe Datashake::ReviewScraper::V2::Profiles::AddBulk do
  let(:client) { Datashake::ReviewScraper::Client.new(token: "abcdef") }

  subject { described_class.new(client) }

  it "returns 200" do
    VCR.use_cassette("v2/profiles/add_bulk_profiles") do
      response = subject
        .payload(
          [
            {
              url: "https://www.homeaway.com/vacation-rental/p4494671",
              callback: "https://app.reviewcompany.com/datashake_callback",
              from_date: "2021-01-01"
            },
            {
              query: "I-80 Towing & Service, 1209 S 3rd St, Laramie, WY 82070, USA",
              callback: "https://app.reviewcompany.com/datashake_callback",
              blocks: "10"
            }
          ]
        )
        .fetch

      first_job = response.first
      second_job = response.last

      expect(first_job.success).to be(true)
      expect(first_job.job_id).to eq(348534142)
      expect(first_job.status).to eq(200)
      expect(first_job.message).to eq("Added this profile to the queue...")
      expect(first_job.from_date).to eq(Date.parse("2021-01-01"))
      expect(first_job.callback).to eq("https://app.reviewcompany.com/datashake_callback")

      expect(second_job.success).to be(true)
      expect(second_job.job_id).to eq(348534143)
      expect(second_job.status).to eq(200)
      expect(second_job.message).to eq("Added this profile to the queue...")
      expect(second_job.blocks).to eq(10)
      expect(second_job.callback).to eq("https://app.reviewcompany.com/datashake_callback")
    end
  end
end
