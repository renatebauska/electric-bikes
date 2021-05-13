require 'rails_helper'

# rspec spec/models/schedule_spec.rb

RSpec.describe Schedule, type: :model do
  describe "validations" do
    let(:schedule) { FactoryBot.build(:schedule) }

    it "should have a bike" do
      schedule.bike = nil
      expect(schedule).to_not be_valid
    end

    it "should have a user" do
      schedule.user = nil
      expect(schedule).to_not be_valid
    end

    it "should have a start at" do
      schedule.start_at = nil
      expect(schedule).to_not be_valid
    end

    it "should have a end at" do
      schedule.end_at = nil
      expect(schedule).to_not be_valid
    end
  end
end
