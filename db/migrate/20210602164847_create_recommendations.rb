class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.integer :videogame_id
      t.string :body
      t.integer :recipient_id
      t.integer :sender_id

      t.timestamps
    end
  end
end
