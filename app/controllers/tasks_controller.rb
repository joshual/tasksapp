class TasksController < ApplicationController
  before_filter :authenticate_user!


  def index
  	@task = Task.new
  	@tasks = current_user.tasks
  end

  def create
    
  	@task = Task.new params[:task]
    @task.user = current_user
    @task.save

  	redirect_to :back

  end

  def edit

  	@task = Task.find(params[:id])
  end

def update
	task = Task.find(params[:id]) 
	if task.update_attributes params[:task]
		redirect_to tasks_path ,:notice=>'Your task was updated.'
	else
		redirect_to :back,:notice=>'There was an error updating your task.'
	end 

end

def destroy
  Task.delete params[:id]
  redirect_to :back,:notice => 'Task has been deleted.'
end


end
