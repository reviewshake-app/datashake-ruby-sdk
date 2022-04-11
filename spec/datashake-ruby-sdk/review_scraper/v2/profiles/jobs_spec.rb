# frozen_string_literal: true

require "spec_helper"

RSpec.describe Datashake::ReviewScraper::V2::Profiles::Jobs do
  let(:client) do
    Datashake::ReviewScraper::V2.new(
      Datashake::ReviewScraper::Client.new(token: "abcdef")
    )
  end

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

        expect(response.total).to eq(3)
        expect(response.per_page).to eq(2)
        expect(response.page).to eq(2)

        job = response.jobs.first
        expect(job.job_id).to eq(346_998_013)
        expect(job.url).to eq("https://www.amazon.com/dp/B003YH9MMI")
        expect(job.place_id).to eq(nil)
        expect(job.status).to eq("complete")
        expect(job.last_crawl).to eq(Date.parse("2022-04-05"))
        expect(job.from_date).to be_nil
        expect(job.blocks).to be_nil
        expect(job.diff).to be_nil
        expect(job.credits_used).to eq(138)
        expect(job.created_at).to eq(Date.parse("2022-04-05"))
      end
    end
  end
end
