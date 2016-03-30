require 'rails_helper'

RSpec.describe SectionsController, type: :controller do

  describe "sections#new action" do
    it "should display the new section page" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "sections#create action" do
    it "should create a new section in the database" do
      post :create, section: {name: 'Availabilities'}
      expect(response).to redirect_to root_path

      section = Section.last
      expect(section.name).to eq("Availabilities")
    end
  end

  describe "sections#show action" do
    it "should display a section to a user" do
      new_section = Section.create(name: 'Availabilities')
      get :show, id: new_section.id
      expect(response).to have_http_status(:success)
    end
  end
end
