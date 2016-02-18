class Group < ActiveRecord::Base
  validate :title, presence: true
end
