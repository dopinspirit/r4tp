require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe "POST create" do
    it "creates a project" do
      post :create, project: {name: "Runaway" }
      expect(response).to redirect_to(projects_path)
    end

    it "goes back to the form on failure" do
      post :create, project: {name: ""}
      expect(response).to render_template(:new)
      expect(assigns(:project)).to be_present
    end
  end

end
