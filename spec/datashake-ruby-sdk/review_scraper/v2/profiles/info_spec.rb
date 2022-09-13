# frozen_string_literal: true

require "spec_helper"

RSpec.describe Datashake::ReviewScraper::V2::Profiles::Info do
  let(:client) do
    Datashake::ReviewScraper::V2.new(
      Datashake::ReviewScraper::Client.new(token: "abcdef")
    )
  end

  subject { described_class.new(client) }

  context "when the job is in maintenance" do
    it "returns 200", :aggregate_failures do
      VCR.use_cassette("v2/profiles/info/maintenance") do
        response = subject
          .job_id(410391486)
          .fetch

        expect(response.success).to be(true)
        expect(response.status).to eq(200)
        expect(response.job_id).to eq(410391486)
        expect(response.source_url).to eq("https://www.lawyers.com/fadfadfdasfa")
        expect(response.source_name).to eq("lawyers")
        expect(response.place_id).to be_nil
        expect(response.external_identifier).to eq("123")
        expect(response.meta_data).to be_nil
        expect(response.unique_id).to be_nil
        expect(response.review_count).to be_nil
        expect(response.average_rating).to be_nil
        expect(response.last_crawl).to be_nil
        expect(response.crawl_status).to eq("maintenance")
        expect(response.percentage_complete).to eq(0)
        expect(response.result_count).to eq(0)
        expect(response.credits_used).to eq(8)
        expect(response.from_date).to be_nil
        expect(response.blocks).to be_nil
      end
    end
  end

  context "when the job is complete" do
    it "returns 200" do
      VCR.use_cassette("v2/profiles/info/success") do
        response = subject
          .job_id(348548418)
          .fetch

        expect(response.success).to be(true)
        expect(response.status).to eq(200)
        expect(response.job_id).to eq(348548418)
        expect(response.source_url).to eq("https://www.amazon.com/dp/B003YH9MMI")
        expect(response.source_name).to eq("amazon")
        expect(response.place_id).to be_nil
        expect(response.external_identifier).to eq("123")
        expect(response.meta_data).to eq({"star_ratings" => {"1star" => "1%", "2star" => "4%", "3star" => "7%", "4star" => "27%", "5star" => "61%"}})
        expect(response.unique_id).to be_nil
        expect(response.review_count).to eq(214)
        expect(response.average_rating).to eq(4.4)
        expect(response.last_crawl).to eq(Date.parse("2022-04-08"))
        expect(response.crawl_status).to eq("complete")
        expect(response.percentage_complete).to eq(100)
        expect(response.result_count).to eq(0)
        expect(response.credits_used).to eq(8)
        expect(response.from_date).to eq(Date.parse("2022-02-01"))
        expect(response.blocks).to eq(10)
      end
    end
  end
end
