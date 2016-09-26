class Task < ActiveRecord::Base
	has_many :tasks

	enum status: {"Done": 0, "In process": 1,  "To Do":2}
	
	validates :title, presence: true	
end
