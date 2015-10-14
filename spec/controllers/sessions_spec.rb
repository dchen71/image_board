require "rails_helper"

RSpec.describe SessionsController, :type => :controller do
  describe "main functionality" do
    fixtures :users

    it 'should be able to access new' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end

