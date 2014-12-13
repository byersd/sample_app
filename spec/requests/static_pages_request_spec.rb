require 'rails_helper'

describe "Static Pages" do

  describe "Home page" do

    before { visit home_path }

    it "should have the title 'Home'" do
      expect(page).to have_title(full_title("Home"))
    end

    it "should have the content 'Home page'" do
      expect(page).to have_content('Home page')
    end

  end

  describe "Help page" do

    before { visit help_path }

    it "should have the title 'Help'" do
      expect(page).to have_title(full_title("Help"))
    end

    it "should have the content 'Help page'" do
      expect(page).to have_content('Help page')
    end

  end

  describe "About page" do

    before { visit about_path }

    it "should have the title 'About'" do
      expect(page).to have_title(full_title("About"))
    end

    it "should have the content 'About page'" do
      expect(page).to have_content('About page')
    end

  end

end
