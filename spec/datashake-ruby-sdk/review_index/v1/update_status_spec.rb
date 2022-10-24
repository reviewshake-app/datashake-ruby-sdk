# frozen_string_literal: true

require "spec_helper"

RSpec.describe Datashake::ReviewIndex::V1::UpdateStatus do
  let(:client) do
    Datashake::ReviewIndex::V1.new(
      Datashake::ReviewIndex::Client.new(token: "abcdef")
    )
  end

  let(:request_id) { "1666354438254572526-6871ffd1-d7e4-48" }

  subject { described_class.new(client) }

  context "when request_id is given" do
    it "returns 201" do
      VCR.use_cassette("review_index/v1/update_status/with_request_id") do
        response = subject.request_id(request_id).fetch

        expect(response.request_id).to eq(request_id)
        expect(response.http_status).to eq(200)
        expect(response.status).to eq("FAILED")
        expect(response.created_at).to eq("2022-10-21T12:13:58")
        expect(response.completeness_rate).to eq(0.0)
        expect(response.success_rate).to eq(0.0)
        expect(response.size).to eq(0)
      end
    end
  end

  context "when request_id is not given" do
    it "throws an error", :aggregate_failures do
      VCR.use_cassette("review_index/v1/update_status/no_request_id") do
        expect { subject.fetch }
          .to raise_error do |error|
          expect(error).to be_a(Datashake::ReviewIndex::V1::Error)
          expect(error.message).to eq("Bad request")
          expect(error.status).to eq(400)
        end
      end
    end
  end
end
