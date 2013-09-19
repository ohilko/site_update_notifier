class Identity < OmniAuth::Identity::Models::ActiveRecord
	
  # this variables need for validate data
  validates_presence_of :name
  validates_uniqueness_of :email
  validates_format_of :email, :with => /@/
end
