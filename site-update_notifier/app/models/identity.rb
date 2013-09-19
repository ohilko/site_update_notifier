# == Schema Information
#
# Table name: identities
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Identity < OmniAuth::Identity::Models::ActiveRecord
	
  # this variables need for validate data
  validates_presence_of :name
  validates_uniqueness_of :email
  validates_format_of :email, :with => /@/
end
