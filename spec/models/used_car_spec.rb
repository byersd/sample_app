require 'rails_helper'

describe UsedCar do

  before { @used_car = UsedCar.new }

  subject { @used_car }

  it { should respond_to(:car_num) }
  it { should respond_to(:car_ref) }

  # Validation of attribute presence.

  describe "when car_num and car_ref are not present" do
    it "should not be valid" do
      @used_car.car_num = " "
      @used_car.car_ref = " "
      should_not be_valid
    end
  end

  describe "when car_num is not present" do
    it "should not be valid" do
      @used_car.car_num = " "
      @used_car.car_ref = "DEF"
      should_not be_valid
    end
  end

  describe "when car_ref is not present" do
    it "should not be valid" do
      @used_car.car_num = "ABC"
      @used_car.car_ref = " "
      should_not be_valid
    end
  end

  describe "when car_num and car_ref are present" do
    it "should be valid" do
      @used_car.car_num = "ABC"
      @used_car.car_ref = "DEF"
      should be_valid
    end
  end

  # Validation of attribute length.

  describe "when car_num is less than maximum valid length" do
    it "should be valid" do
      @used_car.car_num = "A" * (UsedCar::VALID_CAR_NUM_LENGTH - 1)
      @used_car.car_ref = "DEF"
      should be_valid
    end
  end

  describe "when car_num is equal to maximum valid length" do
    it "should be valid" do
      @used_car.car_num = "A" * (UsedCar::VALID_CAR_NUM_LENGTH)
      @used_car.car_ref = "DEF"
      should be_valid
    end
  end

  describe "when car_num is more than maximum valid length" do
    it "should not be valid" do
      @used_car.car_num = "A" * (UsedCar::VALID_CAR_NUM_LENGTH + 1)
      @used_car.car_ref = "DEF"
      should_not be_valid
    end
  end

  describe "when car_ref is less than maximum valid length" do
    it "should be valid" do
      @used_car.car_num = "ABC"
      @used_car.car_ref = "D" * (UsedCar::VALID_CAR_REF_LENGTH - 1)
      should be_valid
    end
  end

  describe "when car_ref is equal to maximum valid length" do
    it "should be valid" do
      @used_car.car_num = "ABC"
      @used_car.car_ref = "D" * (UsedCar::VALID_CAR_REF_LENGTH)
      should be_valid
    end
  end

  describe "when car_ref is more than maximum valid length" do
    it "should not be valid" do
      @used_car.car_num = "ABC"
      @used_car.car_ref = "D" * (UsedCar::VALID_CAR_REF_LENGTH + 1)
      should_not be_valid
    end
  end

  # Validation of attribute format.

  describe "when car_num is not of valid format" do
    it "should not be valid" do
      @used_car.car_num = "A!!"
      @used_car.car_ref = "DEF"
      should_not be_valid
    end
  end

  describe "when car_ref is not of valid format" do
    it "should not be valid" do
      @used_car.car_num = "ABC"
      @used_car.car_ref = "D!!"
      should_not be_valid
    end
  end

  # Tests for initialize.

  describe "when initialized with no values for car_num and car_ref" do
    it "should have no values for car_num and car_ref" do
      initialized_used_car = UsedCar.new
      expect(initialized_used_car.car_num).to be_nil
      expect(initialized_used_car.car_ref).to be_nil
    end
  end

  describe "when initialized with car_num only" do
    it "should have car_num only" do
      initialized_used_car = UsedCar.new(car_num: "ABC")
      expect(initialized_used_car.car_num).to eq("ABC")
      expect(initialized_used_car.car_ref).to be_nil
    end
  end

  describe "when initialized with car_ref only" do
    it "should have car_ref only" do
      initialized_used_car = UsedCar.new(car_ref: "DEF")
      expect(initialized_used_car.car_num).to be_nil
      expect(initialized_used_car.car_ref).to eq("DEF")
    end
  end

  describe "when initialized with car_num and car_ref" do
    it "should have car_num and car_ref" do
      initialized_used_car = UsedCar.new(car_num: "ABC" , car_ref: "DEF")
      expect(initialized_used_car.car_num).to eq("ABC")
      expect(initialized_used_car.car_ref).to eq("DEF")
    end
  end

end
