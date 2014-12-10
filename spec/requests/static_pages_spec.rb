require 'rails_helper'

describe "Static Pages requests" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home page" do

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title} | Home")
    end

    it "should have the content 'Home page'" do
      visit '/static_pages/home'
      expect(page).to have_content('Home page')
    end

  end

  describe "Help page" do

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Help")
    end

    it "should have the content 'Help page'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help page')
    end

  end

  describe "About page" do

    it "should have the title 'About'" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title} | About")
    end

    it "should have the content 'About page'" do
      visit '/static_pages/about'
      expect(page).to have_content('About page')
    end

  end

end
