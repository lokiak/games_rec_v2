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
  belongs_to(:recipient, { :required => false, :class_name => "User", :foreign_key => "recipient_id" })
  belongs_to(:sender, { :required => false, :class_name => "User", :foreign_key => "sender_id" })
  belongs_to(:videogame, { :required => false, :class_name => "Videogame", :foreign_key => "videogame_id", :counter_cache => true })
  has_one(:genre, { :through => :videogame, :source => :genre })

  validates(:sender_id, { :presence => true })
  validates(:recipient_id, { :presence => true })
  validates(:recipient_id, { :uniqueness => { :scope => ["sender_id"] } })
end
