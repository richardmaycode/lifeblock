require 'rails_helper'

RSpec.describe Reflection, type: :model do
  subject(:reflection) { create(:reflection)}
  describe "#completed_cannot_be_in_the_future" do
    context "When completed is in the past" do
      it "will not add an error" do
        expect(subject.errors.where(:completed).count).to equal(0)
      end
    end

    context "When completed is in the future" do
      it "will add an error" do
        subject.completed = Time.zone.tomorrow
        expect(subject).not_to be_valid
      end
    end
  end
  
end
