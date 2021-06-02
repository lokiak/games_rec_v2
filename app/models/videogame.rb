# == Schema Information
#
# Table name: videogames
#
#  id                    :integer          not null, primary key
#  game_photo            :string
#  published             :datetime
#  publisher             :string
#  recommendations_count :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class Videogame < ApplicationRecord
  has_one(:genre, { :class_name => "Genre", :foreign_key => "game_id", :dependent => :destroy })
  has_many(:recommendations, { :class_name => "Recommendation", :foreign_key => "videogame_id", :dependent => :destroy })
end
