# frozen_string_literal: true

require "spec_helper"

RSpec.describe Datashake::ReviewScraper::V2::Profiles::Add do
  let(:client) do
    Datashake::ReviewScraper::V2.new(
      Datashake::ReviewScraper::Client.new(token: "abcdef")
    )
  end

  subject { described_class.new(client) }

  context "when token is invalid" do
    it "returns 401" do
      VCR.use_cassette("v2/profiles_invalid_token") do
        expect { subject.url("https://www.amazon.com/dp/B003YH9MMI").fetch }
          .to raise_error(Datashake::ReviewScraper::V2::Error)
      end
    end
  end

  context "when token is valid" do
    context "and url param is given" do
      it "returns 200" do
        VCR.use_cassette("v2/profiles/add_profile_with_url") do
          response = subject.url("https://www.amazon.com/dp/B003YH9MMI").fetch

          expect(response.success).to be(true)
          expect(response.job_id).to eq(346_998_052)
          expect(response.status).to eq(200)
          expect(response.message).to eq("Added this profile to the queue...")
        end
      end

      context "and optional params are given" do
        it "returns 200" do
          VCR.use_cassette("v2/profiles/add_profile_with_url_and_options") do
            response = subject
              .url("https://www.amazon.com/dp/B003YH9MMI")
              .from_date("2022-02-01")
              .blocks(50)
              .diff(346_998_052)
              .callback("https://app.reviewcompany.com/datashake_callback")
              .external_identifier("qwerty123")
              .fetch

            expect(response.success).to be(true)
            expect(response.job_id).to eq(348535659)
            expect(response.status).to eq(200)
            expect(response.message).to eq("Added this profile to the queue...")
          end
        end
      end
    end

    context "and query param is given" do
      it "returns 200" do
        VCR.use_cassette("v2/profiles/add_profile_with_query") do
          response = subject.query(
            "I-80 Towing & Service, 1209 S 3rd St, Laramie, WY 82070, USA"
          ).fetch

          expect(response.success).to be(true)
          expect(response.job_id).to eq(44_124)
          expect(response.status).to eq(200)
          expect(response.message).to eq("Added this profile to the queue...")
        end
      end
    end

    context "and place_id param is given" do
      it "returns 200" do
        VCR.use_cassette("v2/profiles/add_profile_with_place_id") do
          response = subject.place_id("ChIJr5dFzfKAhYARj99B34yuZOw").fetch

          expect(response.success).to be(true)
          expect(response.job_id).to eq(44_125)
          expect(response.status).to eq(200)
          expect(response.message).to eq("Added this profile to the queue...")
        end
      end
    end
  end
end
