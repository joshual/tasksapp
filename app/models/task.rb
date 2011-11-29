class Task < ActiveRecord::Base
	belongs_to :user
	validates :task, :presence => true
end
