class FavoriteAnime < ApplicationRecord
  belongs_to :user
  belongs_to :anime
end
