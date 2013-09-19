# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Resource < ActiveRecord::Base
  # link with user
  belongs_to :user
end
