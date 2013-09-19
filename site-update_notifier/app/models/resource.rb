class Resource < ActiveRecord::Base
  # link with user
  belongs_to :user
end
