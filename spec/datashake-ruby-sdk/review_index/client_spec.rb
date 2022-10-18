# frozen_string_literal: true

require "spec_helper"

RSpec.describe Datashake::ReviewIndex::Client do
  subject { described_class.new(token: "abc") }

  describe "#profiles" do
    specify do
      expect(subject.profiles).to be_an_instance_of(Datashake::ReviewIndex::V1::Profiles)
    end
  end

  describe "#reviews" do
    specify do
      expect(subject.reviews).to be_an_instance_of(Datashake::ReviewIndex::V1::Reviews)
    end
  end

  describe "#update_status" do
    specify do
      pending("not implemented because /update/status doesn't work at ReviewIndex for now")
      expect(subject.pending_status).to be_an_instance_of(Datashake::ReviewIndex::V1::PendingStatus)
    end
  end
end
