# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  genre      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer
#
class Genre < ApplicationRecord
  belongs_to(:game, { :required => false, :class_name => "Videogame", :foreign_key => "game_id" })

  has_one(:recommended_genre, { :through => :game, :source => :recommendations })
end
