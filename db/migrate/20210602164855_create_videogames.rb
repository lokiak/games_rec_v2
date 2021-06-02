class CreateVideogames < ActiveRecord::Migration[6.0]
  def change
    create_table :videogames do |t|
      t.string :publisher
      t.datetime :published
      t.string :game_photo
      t.integer :recommendations_count

      t.timestamps
    end
  end
end
