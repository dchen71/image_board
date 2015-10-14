require "rails_helper"

RSpec.describe TagsController, :type => :controller do
  describe "main functionality" do
    fixtures :users, :images,:tags

    it 'search should work' do
      @tag = tags(:tag1)
      get :search, id: @tag.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'should be able to use show' do
      @tag = tags(:tag1)
      get :show, id: @tag.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
