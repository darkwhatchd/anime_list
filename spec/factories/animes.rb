FactoryBot.define do
  factory :anime do
    sequence(:name) { |n| "Anime #{n}" }
    description { Faker::Lorem.paragraph }
    status { :in_progress }
    release_date { Date.today - 1.day }
    finish_date { Date.today }
  end
end
