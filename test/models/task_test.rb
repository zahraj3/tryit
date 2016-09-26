require 'test_helper'

class TaskTest < ActiveSupport::TestCase
	test "should not save task without title and parrentid" do
	  task = Task.new 
	  assert_not task.save, "Saved the task without title or parrentid"
	end

	#otestuj vsechny parametry
	#otestuj, ze se neda smazat zaznam pokud existuji nasledovnici
	
end
