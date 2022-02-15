require "rails_helper"

RSpec.describe Anime, type: :model do
  it { is_expected.to validate_presence_of(:cover) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:release_date) }

  it { is_expected.to have_many(:favorite_animes).dependent(:destroy) }
  it { is_expected.to have_many(:users).through(:favorite_animes) }

  it "can't have future release_date" do
    subject.release_date = Date.tomorrow
    subject.valid?
    expect(subject.errors.attribute_names).to include :release_date
  end

  it "is valid with current release_date" do
    subject.release_date = Time.zone.now
    subject.valid?
    expect(subject.errors.attribute_names).to_not include :release_date
  end

  it "is valid with past date" do
    subject.release_date = Time.zone.now - 1.day
    subject.valid?
    expect(subject.errors.attribute_names).to_not include :release_date
  end

  it "can't have future finish_date" do
    subject.finish_date = Date.tomorrow
    subject.valid?
    expect(subject.errors.attribute_names).to include :finish_date
  end

  it "is valid with current finish_date" do
    subject.finish_date = Time.zone.now
    subject.valid?
    expect(subject.errors.attribute_names).to_not include :finish_date
  end

  it "is valid with past date" do
    subject.finish_date = Time.zone.now - 1.day
    subject.valid?
    expect(subject.errors.attribute_names).to_not include :finish_date
  end
end
