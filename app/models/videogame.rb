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
end
