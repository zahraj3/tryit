class ChangeTypeOfColumnStatus < ActiveRecord::Migration
  def change
  	change_column :tasks, :status, :integer
  end
end
