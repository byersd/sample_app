require 'rails_helper'

describe StaticPagesController do

  describe "Home controller action" do
    it "should respond with success" do
      get :home
      expect(response).to be_success
    end
  end

  describe "Help controller action" do
    it "should respond with success" do
      get :help
      expect(response).to be_success
    end
  end

  describe "About controller action" do
    it "should respond with success" do
      get :about
      expect(response).to be_success
    end
  end

end
