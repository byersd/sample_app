require 'rails_helper'

describe "Used Cars" do

  let(:base_title) { "Arnold Clark Used Car Search" }

  subject { page }

  describe "Index page" do

    before { visit index_path }

    it { should have_title("Used Car Lookup | #{base_title}") }
    it { should have_content("Used Car Lookup") }
    it { should have_field("Car Num") }
    it { should have_field("Car Ref") }
    it { should have_selector("input[type='submit'][value='Search']") }
    it { should have_link("Arnold Clark", href: "http://www.arnoldclark.com/") }

    describe "when user input is blank" do
      it "should display appropriate messages" do
        fill_in "Car Num", with: ""
        fill_in "Car Ref", with: ""
        click_button "Search"

        expect(current_path).to start_with('/search')

        should have_selector("div[class='alert alert-danger']", text: "errors")
        should have_content("Car Num can't be blank")
        should have_content("Car Ref can't be blank")
        expect(find_field("Car Num").value).to eq("")
        expect(find_field("Car Ref").value).to eq("")
      end
    end

    describe "when user input is invalid" do
      it "should display appropriate messages" do
        fill_in "Car Num", with: "ABC"
        fill_in "Car Ref", with: "DEF"
        click_button "Search"

        expect(current_path).to start_with('/search')

        should have_selector("div[class='alert alert-danger']", text: "errors")
        should have_content("Car Num is too short")
        should have_content("Car Ref is too short")
        expect(find_field("Car Num").value).to eq("ABC")
        expect(find_field("Car Ref").value).to eq("DEF")
      end
    end

    describe "when user input is valid" do
      it "should display images" do
        fill_in "Car Num", with: "AB12CDEF"
        fill_in "Car Ref", with: "ARNXY-U-45678"
        click_button "Search"

        expect(current_path).to start_with('/search')

        should have_selector("div[class='alert alert-success']", text: "Success")
        expect(find_field("Car Num").value).to eq("AB12CDEF")
        expect(find_field("Car Ref").value).to eq("ARNXY-U-45678")

        UsedCar.new(car_num: "AB12CDEF" , car_ref: "ARNXY-U-45678").image_urls.each do |image_url|
          should have_selector("img[src='#{image_url}']")
        end
      end
    end

  end

  describe "Search page" do

    before { visit '/search?used_car[car_num]=&used_car[car_ref]=' }

    it { should have_title("Used Car Lookup | #{base_title}") }
    it { should have_content("Used Car Lookup") }
    it { should have_field("Car Num") }
    it { should have_field("Car Ref") }
    it { should have_selector("input[type='submit'][value='Search']") }
    it { should have_link("Arnold Clark", href: "http://www.arnoldclark.com/") }

    describe "when params are blank" do
      it "should display appropriate messages" do
        visit '/search?used_car[car_num]=&used_car[car_ref]='

        should have_selector("div[class='alert alert-danger']", text: "errors")
        should have_content("Car Num can't be blank")
        should have_content("Car Ref can't be blank")
        expect(find_field("Car Num").value).to eq("")
        expect(find_field("Car Ref").value).to eq("")
      end
    end

    describe "when params are invalid" do
      it "should display appropriate messages" do
        visit '/search?used_car[car_num]=ABC&used_car[car_ref]=DEF'

        should have_selector("div[class='alert alert-danger']", text: "errors")
        should have_content("Car Num is too short")
        should have_content("Car Ref is too short")
        expect(find_field("Car Num").value).to eq("ABC")
        expect(find_field("Car Ref").value).to eq("DEF")
      end
    end

    describe "when params are valid" do
      it "should display images" do
        visit '/search?used_car[car_num]=AB12CDEF&used_car[car_ref]=ARNXY-U-45678'

        should have_selector("div[class='alert alert-success']", text: "Success")
        expect(find_field("Car Num").value).to eq("AB12CDEF")
        expect(find_field("Car Ref").value).to eq("ARNXY-U-45678")

        UsedCar.new(car_num: "AB12CDEF" , car_ref: "ARNXY-U-45678").image_urls.each do |image_url|
          should have_selector("img[src='#{image_url}']")
        end
      end
    end

  end

end
