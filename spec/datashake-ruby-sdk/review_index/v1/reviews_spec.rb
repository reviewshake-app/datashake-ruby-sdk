# frozen_string_literal: true

require "spec_helper"

RSpec.describe Datashake::ReviewIndex::V1::Reviews do
  let(:client) do
    Datashake::ReviewIndex::V1.new(
      Datashake::ReviewIndex::Client.new(token: "abcdef")
    )
  end

  subject { described_class.new(client) }

  context "when token is invalid" do
    it "throwns an error", :aggregate_failures do
      VCR.use_cassette("review_index/v1/reviews/invalid_token") do
        expect do
          subject.callback("https://xmpl.com/cb").name("KFC").fetch
        end
          .to raise_error do |error|
            expect(error).to be_a(Datashake::ReviewIndex::V1::Error)
            expect(error.message).to eq("User unauthorized.")
            expect(error.status).to eq(401)
          end
      end
    end
  end

  context "when token is valid" do
    context "and required params are given" do
      it "returns 201" do
        VCR.use_cassette("review_index/v1/reviews/with_callback_and_name") do
          response = subject.callback("https://xmpl.com/cb").name("KFC").fetch

          expect(response.success).to be(true)
          expect(response.request_id).to eq("1665992737596342636-004fd578-fd32-41")
          expect(response.status).to eq(201)
          expect(response.message).to eq("Your task was successfully submitted.")
        end
      end
    end

    context "but no required param is given" do
      it "throws an error", :aggregate_failures do
        VCR.use_cassette("review_index/v1/reviews/no_callback") do
          expect { subject.name("KFC").fetch }
            .to raise_error do |error|
              expect(error).to be_a(Datashake::ReviewIndex::V1::Error)
              expect(error.message).to eq("Bad request")
              expect(error.status).to eq(400)
            end
        end

        VCR.use_cassette("review_index/v1/reviews/no_name") do
          expect { subject.name(nil).callback("https://xmpl.com/cb").fetch }
            .to raise_error do |error|
              expect(error).to be_a(Datashake::ReviewIndex::V1::Error)
              expect(error.message).to eq("Bad request")
              expect(error.status).to eq(400)
            end
        end
      end
    end

    context "and optional params are given" do
      context "when options are ok" do
        it "returns 201", :aggregate_failures do
          VCR.use_cassette("review_index/v1/reviews/with_options") do
            response =
              subject
                .callback("https://xmpl.com/cb")
                .name("KFC")
                .domain("kfc.com")
                .ticker_symbol("YUM")
                .phone_number("+13323458424")
                .street("8th Ave")
                .city("New York")
                .zip_code("10001")
                .state("NY")
                .country("US")
                .update(true)
                .external_identifier("some_id")
                .fetch
            expect(response.success).to be(true)
            expect(response.request_id).to eq("1665992600594908271-f1e56cb6-2a3d-47")
            expect(response.status).to eq(201)
            expect(response.credits_used).to be_nil
            expect(response.details).to be_nil
            expect(response.message).to eq("Your task was successfully submitted.")
          end
        end
      end

      context "when trying to use both update and pagination" do
        it "throws an error", :aggregate_failures do
          VCR.use_cassette("review_index/v1/reviews/update_on_pagination") do
            expect do
              subject.callback("https://xmpl.com/cb").name("KFC").update(true).page_number(2).per_page(1).fetch
            end
              .to raise_error do |error|
                expect(error).to be_a(Datashake::ReviewIndex::V1::Error)
                expect(error.message).to eq("Bad request")
                expect(error.status).to eq(400)
              end
          end
        end
      end
    end
  end
end
