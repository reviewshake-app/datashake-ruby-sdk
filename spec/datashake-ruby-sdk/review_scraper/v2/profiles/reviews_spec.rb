# frozen_string_literal: true

require "spec_helper"

RSpec.describe Datashake::ReviewScraper::V2::Profiles::Reviews do
  let(:client) do
    Datashake::ReviewScraper::V2.new(
      Datashake::ReviewScraper::Client.new(token: "abcdef")
    )
  end

  subject { described_class.new(client) }

  it "returns 200" do
    VCR.use_cassette("review_scraper/v2/profiles/reviews") do
      response = subject
        .job_id(349179093)
        .fetch

      expect(response.success).to be(true)
      expect(response.status).to eq(200)
      expect(response.job_id).to eq(349179093)
      expect(response.source_url).to eq("Cafe Grumpy - Grand Central Terminal")
      expect(response.source_name).to eq("google")
      expect(response.place_id).to eq("ChIJPVwsIAJZwokRZwG7oezgams")
      expect(response.external_identifier).to be_nil
      expect(response.meta_data).to eq(
        {"address" => "89 E 42nd St, New York, NY 10017", "name" => "Cafe Grumpy - Grand Central Terminal", "datashake_review_uuid" => "3288163d-9ea6-3335-ab24-21dec1b6bd44"}
      )
      expect(response.unique_id).to eq("ChIJPVwsIAJZwokRZwG7oezgams")
      expect(response.review_count).to eq(550)
      expect(response.average_rating).to eq(4.4)
      expect(response.last_crawl).to eq(Date.parse("2022-04-09"))
      expect(response.crawl_status).to eq("complete")
      expect(response.percentage_complete).to eq(100)
      expect(response.result_count).to eq(550)
      expect(response.credits_used).to eq(560)
      expect(response.from_date).to be_nil
      expect(response.blocks).to be_nil

      review = response.reviews.first
      expect(review.id).to eq(5799839776)
      expect(review.name).to eq("alicemariamurphy")
      expect(review.date).to eq(Date.parse("2022-04-07"))
      expect(review.rating_value).to eq(5.0)
      expect(review.review_text).to eq("Good coffee, long lines")
      expect(review.url).to eq("https://www.google.com/maps/contrib/0550898390948/place/JZwokRZwG7oezgams")
      expect(review.profile_picture).to eq("https://lh3.googleusercontent.com/a-/YFSPGPFgjDMQ=s240-c-c-br100")
      expect(review.location).to be_nil
      expect(review.review_title).to be_nil
      expect(review.verified_order).to be(false)
      expect(review.language_code).to be_nil
      expect(review.unique_id).to eq("109955990550898390948")
      expect(review.meta_data).to be_nil
      expect(review.response.id).to eq(419632310)
      expect(review.response.name).to eq("Response from the owner")
      expect(review.response.date).to eq(Date.parse("2021-11-11"))
      expect(review.response.comment).to eq("Thank you Denise!")
    end
  end

  context "and all other optional params are given" do
    it "returns 200" do
      VCR.use_cassette("review_scraper/v2/profiles/reviews_with_options") do
        response = subject
          .job_id(349179093)
          .from_date("2022-02-01")
          .page(2)
          .per_page(1)
          .language_code("en")
          .allow_response(true)
          .fetch

        expect(response.success).to be(true)
        expect(response.status).to eq(200)
        expect(response.job_id).to eq(349179093)
        expect(response.source_url).to eq("Cafe Grumpy - Grand Central Terminal")
        expect(response.source_name).to eq("google")
        expect(response.place_id).to eq("ChIJPVwsIAJZwokRZwG7oezgams")
        expect(response.external_identifier).to be_nil
        expect(response.meta_data).to eq({"address" => "89 E 42nd St, New York, NY 10017", "name" => "Cafe Grumpy - Grand Central Terminal"})
        expect(response.unique_id).to eq("ChIJPVwsIAJZwokRZwG7oezgams")
        expect(response.review_count).to eq(550)
        expect(response.average_rating).to eq(4.4)
        expect(response.last_crawl).to eq(Date.parse("2022-04-09"))
        expect(response.crawl_status).to eq("complete")
        expect(response.percentage_complete).to eq(100)
        expect(response.result_count).to eq(9)
        expect(response.credits_used).to eq(560)
        expect(response.from_date).to be_nil
        expect(response.blocks).to be_nil
        expect(response.reviews.count).to eq(1)

        review = response.reviews.first
        expect(review.id).to eq(5799839788)
        expect(review.name).to eq("Cecilia")
        expect(review.date).to eq(Date.parse("2022-04-04"))
        expect(review.rating_value).to eq(5.0)
        expect(review.review_text).to eq("Amazing coffee, love the vibe.")
        expect(review.url).to eq("https://www.google.com/maps/contrib/69480124/place/RZwG7oezgams")
        expect(review.profile_picture).to eq("https://lh3.googleusercontent.com/a-/0P0KiqBaJw=s240-cbr100")
        expect(review.location).to be_nil
        expect(review.review_title).to be_nil
        expect(review.verified_order).to be(false)
        expect(review.language_code).to be_nil
        expect(review.unique_id).to eq("112986693786969480124")
        expect(review.meta_data).to be_nil
      end
    end
  end

  context "when job id param is not found" do
    it "throwns an error" do
      VCR.use_cassette("review_scraper/v2/profiles/reviews_job_id_not_found") do
        expect do
          subject.job_id(3491790932329819).fetch
        end
          .to raise_error do |error|
            expect(error).to be_a(Datashake::ReviewScraper::V2::Error)
            expect(error.message).to eq("This job ID doesn't exist, please create it")
            expect(error.status).to eq(400)
          end
      end
    end
  end
end
