# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  name       :string(255)
#  user_id    :integer
#  timeout    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Resource < ActiveRecord::Base
  # link with user
  belongs_to :user

  scope :from_users_followed_by, lambda {|user| followed_by(user)}

  validates_presence_of :url
  validates_presence_of :name
  validates_presence_of :timeout

  private
    def self.followed_by(user)
    	following_ids = %(SELECT followed_id FROM relationships
                          WHERE follower_id = :user_id)
      where("user_id IN (#{following_ids}) OR user_id = :user_id",
            :user_id => user)
    	
    end
end
