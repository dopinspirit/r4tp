require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  before(:example) do
    sign_in User.create!(email: "rspec@exmaple.com", password:"password")
  end

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

  describe "GET show" do
    let(:project) { Project.create!(name: "Project Runway") }

    it "allows a user who is part of the project to see the project" do
      allow(controller.current_user).to receive(:can_view?).and_return(true)
      get :show, id: project.id
      expect(response).to render_template(:show)
    end

    it "does not allow a user who is not part of the project to see the project" do
      allow(controller.current_user).to receive(:can_view?).and_return(false)
      get :show, id: project.id
      expect(response).to redirect_to(new_user_session_path)
    end
  end

end
