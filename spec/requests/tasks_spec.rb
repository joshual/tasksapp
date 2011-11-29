require 'spec_helper'

describe "Tasks" do
	before do
		@task = Task.create :task => 'go to bed'
	end
  describe "GET /tasks" do
  	
    it "displays some tasks" do
    	
    	visit tasks_path
    	page.should have_content 'go to bed'
    end

    it "creates a new task" do
    	visit tasks_path
    	fill_in 'Task', :with => 'go to work'
    	click_button 'Create Task'
    	current_path.should == tasks_path
    	page.should have_content 'go to work'

    	#save_and_open_page
	end

  end


  describe "PUT /tasks" do
  	it "edits a task" do
  		visit tasks_path
  		click_link 'Edit'
  		current_path.should == edit_task_path(@task)

  		#page.should have_content 'go to bed'

  		find_field('Task').value.should == 'go to bed'

  		fill_in 'Task', :with => 'updated task'
  		click_button 'Update Task'

  		current_path.should == tasks_path

  		page.should have_content 'updated task'


  	end

  	it "should not update an empty task" do
  		visit tasks_path
  		click_link 'Edit'

  		fill_in 'Task', :with => ''

  		click_button 'Update Task'

  		current_path.should == edit_task_path(@task)
  		page.should have_content 'There was an error updating your task.'

  	end



  end

  describe "DELETE /tasks" do
    it "should delete a task" do
      visit tasks_path
      find("#task_#{@task.id}").click_link 'Delete'

    end
 end





end
