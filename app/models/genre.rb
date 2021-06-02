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
end
