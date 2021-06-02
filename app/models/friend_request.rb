# == Schema Information
#
# Table name: friend_requests
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class FriendRequest < ApplicationRecord

  belongs_to(:recipient, { :required => false, :class_name => "User", :foreign_key => "recipient_id" })
  belongs_to(:sender, { :required => false, :class_name => "User", :foreign_key => "sender_id" })

  validates(:status, { :presence => true })
  validates(:sender_id, { :presence => true })
  validates(:recipient_id, { :presence => true })
  validates(:recipient_id, { :uniqueness => { :scope => ["sender_id"] } })  
end
