# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  user_photo      :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:friend_requests, { :class_name => "FriendRequest", :foreign_key => "recipient_id", :dependent => :destroy })
  has_many(:sent_friend_requests, { :class_name => "FriendRequest", :foreign_key => "sender_id", :dependent => :destroy })
  has_many(:received_recs, { :class_name => "Recommendation", :foreign_key => "recipient_id", :dependent => :destroy })
  has_many(:sent_recommendations, { :class_name => "Recommendation", :foreign_key => "sender_id", :dependent => :destroy })

  validates(:username, { :presence => true })
  validates(:username, { :uniqueness => true })
end
