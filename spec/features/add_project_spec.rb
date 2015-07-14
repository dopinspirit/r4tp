require "rails_helper"

describe "adding projects" do
  it "allows a user to create a project" do
    visit new_project_path
    fill_in "Name", with: "Project Runway"
    click_on("Create Project")
    visit projects_path
    expect(page).to have_content("Project Runway")
    expect(page).to have_selector("#projectname")
  end
end