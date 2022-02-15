require "rails_helper"

class Validatable
  include ActiveModel::Validations
  attr_accessor :date
  validates :date, future_date: true
end

describe FutureDateValidator do
  subject { Validatable.new }

  context "when release_date is before current date" do
    before { subject.date = 1.day.ago }

    it "should be valid" do
      expect(subject.valid?).to be_truthy
    end
  end

  context "when relase_date is equal current date" do
    before { subject.date = Time.zone.now }

    it "should be valid" do
      expect(subject.valid?).to be_truthy
    end
  end

  context "when release_date is greater than current date" do
    before { subject.date = Time.zone.now + 1.day }

    it "should be invalid" do
      expect(subject.valid?).to be_falsey
    end

    it "adds an error on model" do
      subject.valid?
      expect(subject.errors.attribute_names).to include(:date)
    end
  end
end