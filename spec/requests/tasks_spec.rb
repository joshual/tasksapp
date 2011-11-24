require 'spec_helper'

describe "Tasks" do
  describe "GET /tasks" do
    it "displays some tasks" do
    	visit tasks_path
    	page.should have_content 'go to bed'
    end
  end
end
