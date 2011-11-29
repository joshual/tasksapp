class AddUserIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :user_id, :int
  end
end
