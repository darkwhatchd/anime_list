class CreateFollowAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_animes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :anime, null: false, foreign_key: true

      t.timestamps
    end
  end
end
