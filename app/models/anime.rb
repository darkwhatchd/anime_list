class Anime < ApplicationRecord
  has_many :favorite_animes, dependent: :destroy
  has_many :users, through: :favorite_animes

  has_one_attached :cover
  has_rich_text :description

  validates :cover, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :status, presence: true
  validates :release_date, presence: true, future_date: true
  validates :finish_date, future_date: true
end
