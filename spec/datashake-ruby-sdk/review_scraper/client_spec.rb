# frozen_string_literal: true

require "spec_helper"

RSpec.describe Datashake::ReviewScraper::Client do
  subject { described_class.new(token: "abc", endpoint: endpoint) }

  let(:endpoint) { nil }

  describe "#connection" do
    context "when endpoint is provided" do
      let(:endpoint) { "https://custom.endpoint.com" }

      it "uses the provided endpoint as the base_url" do
        expect(subject.connection.url_prefix.to_s).to eq("#{endpoint}/")
      end
    end

    context "when endpoint is not provided" do
      it "uses the default BASE_URL as the base_url" do
        expect(subject.connection.url_prefix.to_s).to eq("#{Datashake::ReviewScraper::Client::BASE_URL}/")
      end
    end
  end

  describe "#profiles" do
    specify do
      expect(subject.profiles).to be_an_instance_of(Datashake::ReviewScraper::V2::Profiles)
    end
  end

  describe "#add_profile" do
    specify do
      expect(subject.add_profile).to be_an_instance_of(Datashake::ReviewScraper::V2::Profiles::Add)
    end
  end

  describe "#add_bulk" do
    specify do
      expect(subject.add_profiles).to be_an_instance_of(Datashake::ReviewScraper::V2::Profiles::AddBulk)
    end
  end

  describe "#jobs" do
    specify do
      expect(subject.jobs).to be_an_instance_of(Datashake::ReviewScraper::V2::Profiles::Jobs)
    end
  end

  describe "#job" do
    specify do
      expect(subject.job(123)).to be_an_instance_of(Datashake::ReviewScraper::V2::Profiles::Job)
    end
  end

  describe "#info" do
    specify do
      expect(subject.info(123)).to be_an_instance_of(Datashake::ReviewScraper::V2::Profiles::Info)
    end
  end

  describe "#reviews" do
    specify do
      expect(subject.reviews(123)).to be_an_instance_of(Datashake::ReviewScraper::V2::Profiles::Reviews)
    end
  end
end
