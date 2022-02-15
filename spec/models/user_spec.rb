require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to define_enum_for(:profile).with_values({ admin: 0, otaku: 1 }) }

  it { is_expected.to have_many(:favorite_animes).dependent(:destroy) }
  it { is_expected.to have_many(:animes).through(:favorite_animes) }
  it { is_expected.to have_many(:follow_animes).dependent(:destroy) }
end
