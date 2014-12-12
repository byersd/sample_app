require 'rails_helper'

describe UsedCarsController do

  subject { response }

  describe "Index controller action" do

    it "should respond with success" do
      get :index
      should be_success
    end

  end

  describe "Search controller action" do

    describe "when no parameters provided" do
      it "should raise error" do
        expect{ get :search }.to raise_error ActionController::ParameterMissing
      end
    end

    describe "when blank parameters provided" do
      it "should respond with success" do
        get :search , :used_car => { car_num: "" , car_ref: "" }
        should be_success
        expect(controller.params[:used_car]).to_not be_nil
        expect(controller.params[:used_car][:car_num]).to eq("")
        expect(controller.params[:used_car][:car_ref]).to eq("")
      end
    end

    describe "when invalid parameters provided" do
      it "should respond with success" do
        get :search , :used_car => { car_num: "ABC" , car_ref: "ABC" }
        should be_success
        expect(controller.params[:used_car]).to_not be_nil
        expect(controller.params[:used_car][:car_num]).to eq("ABC")
        expect(controller.params[:used_car][:car_ref]).to eq("ABC")
      end
    end

    describe "when invalid parameters provided" do
      it "should respond with success" do
        get :search , :used_car => { car_num: "DEF" , car_ref: "DEF" }
        should be_success
        expect(controller.params[:used_car]).to_not be_nil
        expect(controller.params[:used_car][:car_num]).to eq("DEF")
        expect(controller.params[:used_car][:car_ref]).to eq("DEF")
      end
    end

    describe "when valid parameters provided" do
      it "should respond with success" do
        get :search , :used_car => { car_num: "AB12 CDE" , car_ref: "ARNXY-U-34567" }
        should be_success
        expect(controller.params[:used_car]).to_not be_nil
        expect(controller.params[:used_car][:car_num]).to eq("AB12 CDE")
        expect(controller.params[:used_car][:car_ref]).to eq("ARNXY-U-34567")
      end
    end

    describe "when valid parameters provided" do
      it "should respond with success" do
        get :search , :used_car => { car_num: "AB12CDEF" , car_ref: "ARNXY-U-45678" }
        should be_success
        expect(controller.params[:used_car]).to_not be_nil
        expect(controller.params[:used_car][:car_num]).to eq("AB12CDEF")
        expect(controller.params[:used_car][:car_ref]).to eq("ARNXY-U-45678")
      end
    end

  end

end
