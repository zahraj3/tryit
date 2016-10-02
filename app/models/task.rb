class Task < ActiveRecord::Base
	has_many :tasks

	enum status: {"Done": 0, "In Process": 1,  "To Do": 2}
	
	validates :title, :parrent_id, presence: true	
end
