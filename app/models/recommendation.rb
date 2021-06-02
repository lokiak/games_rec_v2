# == Schema Information
#
# Table name: recommendations
#
#  id           :integer          not null, primary key
#  body         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#  videogame_id :integer
#
class Recommendation < ApplicationRecord
end
