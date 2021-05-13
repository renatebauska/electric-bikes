require 'rails_helper'

# rspec spec/models/bike_spec.rb

RSpec.describe Bike, type: :model do
  describe "validations" do
    let(:bike) { FactoryBot.build(:bike) }

    it "should have a name" do
      bike.name = nil
      expect(bike).to_not be_valid
    end

    it "should available equal true" do
      expect(bike.available).to be_truthy
    end
  end
end
