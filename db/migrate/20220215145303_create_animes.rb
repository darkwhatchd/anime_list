class CreateAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :animes do |t|
      t.string :name
      t.integer :status, default: 0
      t.date :release_date
      t.date :finish_date

      t.timestamps
    end
  end
end
