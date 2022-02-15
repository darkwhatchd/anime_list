class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorite_animes, dependent: :destroy
  has_many :animes, through: :favorite_animes
  has_many :follow_animes, dependent: :destroy

  validates :name, presence: true
  validates :profile, presence: true

  enum profile: { admin: 0, otaku: 1 }
end
