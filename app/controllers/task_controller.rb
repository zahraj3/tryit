class TaskController < ApplicationController

  def index
  	@tasks = Task.where(:parrent_id=> nil)
  end

  def statistics
  end
  
end
