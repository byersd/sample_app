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
      @used_car.car_ref = "ARNXY-U-123"
      should_not be_valid
    end
  end

  describe "when car_ref is not present" do
    it "should not be valid" do
      @used_car.car_num = "AB12CDE"
      @used_car.car_ref = " "
      should_not be_valid
    end
  end

  describe "when car_num and car_ref are present" do
    it "should be valid" do
      @used_car.car_num = "AB12CDE"
      @used_car.car_ref = "ARNXY-U-123"
      should be_valid
    end
  end

  # Validation of attribute length.

  describe "when car_num is less than minimum valid length" do
    it "should not be valid" do
      @used_car.car_num = "A" * (UsedCar::MIN_CAR_NUM_LENGTH - 1)
      @used_car.car_ref = "ARNXY-U-123"
      should_not be_valid
    end
  end

  describe "when car_num is equal to minimum valid length" do
    it "should be valid" do
      @used_car.car_num = "A" * (UsedCar::MIN_CAR_NUM_LENGTH)
      @used_car.car_ref = "ARNXY-U-123"
      should be_valid
    end
  end

  describe "when car_num is more than minimum valid length" do
    it "should be valid" do
      @used_car.car_num = "A" * (UsedCar::MIN_CAR_NUM_LENGTH + 1)
      @used_car.car_ref = "ARNXY-U-123"
      should be_valid
    end
  end

  describe "when car_num is less than maximum valid length" do
    it "should be valid" do
      @used_car.car_num = "A" * (UsedCar::MAX_CAR_NUM_LENGTH - 1)
      @used_car.car_ref = "ARNXY-U-123"
      should be_valid
    end
  end

  describe "when car_num is equal to maximum valid length" do
    it "should be valid" do
      @used_car.car_num = "A" * (UsedCar::MAX_CAR_NUM_LENGTH)
      @used_car.car_ref = "ARNXY-U-123"
      should be_valid
    end
  end

  describe "when car_num is more than maximum valid length" do
    it "should not be valid" do
      @used_car.car_num = "A" * (UsedCar::MAX_CAR_NUM_LENGTH + 1)
      @used_car.car_ref = "ARNXY-U-123"
      should_not be_valid
    end
  end

  describe "when car_ref is less than minimum valid length" do
    it "should not be valid" do
      @used_car.car_num = "AB12CDE"
      @used_car.car_ref = "A" * (UsedCar::MIN_CAR_REF_LENGTH - 1)
      should_not be_valid
    end
  end

  describe "when car_ref is equal to minimum valid length" do
    it "should be valid" do
      @used_car.car_num = "AB12CDE"
      @used_car.car_ref = "A" * (UsedCar::MIN_CAR_REF_LENGTH)
      should be_valid
    end
  end

  describe "when car_ref is more than minimum valid length" do
    it "should be valid" do
      @used_car.car_num = "AB12CDE"
      @used_car.car_ref = "A" * (UsedCar::MIN_CAR_REF_LENGTH + 1)
      should be_valid
    end
  end

  describe "when car_ref is less than maximum valid length" do
    it "should be valid" do
      @used_car.car_num = "AB12CDE"
      @used_car.car_ref = "A" * (UsedCar::MAX_CAR_REF_LENGTH - 1)
      should be_valid
    end
  end

  describe "when car_ref is equal to maximum valid length" do
    it "should be valid" do
      @used_car.car_num = "AB12CDE"
      @used_car.car_ref = "A" * (UsedCar::MAX_CAR_REF_LENGTH)
      should be_valid
    end
  end

  describe "when car_ref is more than maximum valid length" do
    it "should not be valid" do
      @used_car.car_num = "AB12CDE"
      @used_car.car_ref = "A" * (UsedCar::MAX_CAR_REF_LENGTH + 1)
      should_not be_valid
    end
  end

  # Validation of attribute format.

  describe "when car_num is not of valid format" do
    it "should not be valid" do
      @used_car.car_num = "A!!"
      @used_car.car_ref = "ARNXY-U-123"
      should_not be_valid
    end
  end

  describe "when car_ref is not of valid format" do
    it "should not be valid" do
      @used_car.car_num = "AB12CDE"
      @used_car.car_ref = "A!!"
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
      initialized_used_car = UsedCar.new(car_num: "AB12CDE")
      expect(initialized_used_car.car_num).to eq("AB12CDE")
      expect(initialized_used_car.car_ref).to be_nil
    end
  end

  describe "when initialized with car_ref only" do
    it "should have car_ref only" do
      initialized_used_car = UsedCar.new(car_ref: "ARNXY-U-123")
      expect(initialized_used_car.car_num).to be_nil
      expect(initialized_used_car.car_ref).to eq("ARNXY-U-123")
    end
  end

  describe "when initialized with car_num and car_ref" do
    it "should have car_num and car_ref" do
      initialized_used_car = UsedCar.new(car_num: "AB12CDE" , car_ref: "ARNXY-U-123")
      expect(initialized_used_car.car_num).to eq("AB12CDE")
      expect(initialized_used_car.car_ref).to eq("ARNXY-U-123")
    end
  end

  # Tests for image_urls.

  describe "when car_num is of length 7" do
    it "should have correct image urls" do
      expected_image_urls = [UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AERDNCX2Y1-BUA3" , :size => "350" , :camera => "f" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AERDNCX2Y1-BUA3" , :size => "350" , :camera => "r" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AERDNCX2Y1-BUA3" , :size => "350" , :camera => "i" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AERDNCX2Y1-BUA3" , :size => "350" , :camera => "4" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AERDNCX2Y1-BUA3" , :size => "350" , :camera => "5" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AERDNCX2Y1-BUA3" , :size => "350" , :camera => "6" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AERDNCX2Y1-BUA3" , :size => "800" , :camera => "f" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AERDNCX2Y1-BUA3" , :size => "800" , :camera => "r" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AERDNCX2Y1-BUA3" , :size => "800" , :camera => "i" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AERDNCX2Y1-BUA3" , :size => "800" , :camera => "4" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AERDNCX2Y1-BUA3" , :size => "800" , :camera => "5" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AERDNCX2Y1-BUA3" , :size => "800" , :camera => "6" }]

      @used_car.car_num = " AB12 CDE "
      @used_car.car_ref = " ARNXY-U-34567 "
      should be_valid
      expect(@used_car.image_urls).to eq(expected_image_urls)
    end
  end

  describe "when car_num is of length 8" do
    it "should have correct image urls" do
      expected_image_urls = [UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AFRENDXCY2-1UB-A4" , :size => "350" , :camera => "f" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AFRENDXCY2-1UB-A4" , :size => "350" , :camera => "r" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AFRENDXCY2-1UB-A4" , :size => "350" , :camera => "i" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AFRENDXCY2-1UB-A4" , :size => "350" , :camera => "4" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AFRENDXCY2-1UB-A4" , :size => "350" , :camera => "5" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AFRENDXCY2-1UB-A4" , :size => "350" , :camera => "6" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AFRENDXCY2-1UB-A4" , :size => "800" , :camera => "f" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AFRENDXCY2-1UB-A4" , :size => "800" , :camera => "r" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AFRENDXCY2-1UB-A4" , :size => "800" , :camera => "i" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AFRENDXCY2-1UB-A4" , :size => "800" , :camera => "4" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AFRENDXCY2-1UB-A4" , :size => "800" , :camera => "5" },
                             UsedCar::BASE_IMAGE_URL % { :obfuscated_stock_reference => "AFRENDXCY2-1UB-A4" , :size => "800" , :camera => "6" }]

      @used_car.car_num = " AB12CDEF "
      @used_car.car_ref = " ARNXY-U-45678 "
      should be_valid
      expect(@used_car.image_urls).to eq(expected_image_urls)
    end
  end

  # Tests for obfuscated_stock_reference.

  describe "when car_num is of length 5" do

    it "should have correct obfuscated_stock_reference" do
      @used_car.car_num = " AB 12 C "
      @used_car.car_ref = " ARNXY-U-12345 "
      should be_valid
      expect(@used_car.send(:obfuscated_stock_reference)).to eq("ACR2N1XBYA1")
    end

    it "should, regardless of case, have correct obfuscated_stock_reference" do
      @used_car.car_num = " ab 12 C "
      @used_car.car_ref = " aRnXy-U-12345 "
      should be_valid
      expect(@used_car.send(:obfuscated_stock_reference)).to eq("ACR2N1XBYA1")
    end

  end

  describe "when car_num is of length 6" do

    it "should have correct obfuscated_stock_reference" do
      @used_car.car_num = " AB 12 CD "
      @used_car.car_ref = " ARNXY-U-23456 "
      should be_valid
      expect(@used_car.send(:obfuscated_stock_reference)).to eq("ADRCN2X1YB-A2")
    end

    it "should, regardless of case, have correct obfuscated_stock_reference" do
      @used_car.car_num = " ab 12 CD "
      @used_car.car_ref = " aRnXy-U-23456 "
      should be_valid
      expect(@used_car.send(:obfuscated_stock_reference)).to eq("ADRCN2X1YB-A2")
    end

  end

  describe "when car_num is of length 7" do

    it "should have correct obfuscated_stock_reference" do
      @used_car.car_num = " AB12 CDE "
      @used_car.car_ref = " ARNXY-U-34567 "
      should be_valid
      expect(@used_car.send(:obfuscated_stock_reference)).to eq("AERDNCX2Y1-BUA3")
    end

    it "should, regardless of case, have correct obfuscated_stock_reference" do
      @used_car.car_num = " ab12 CDE "
      @used_car.car_ref = " aRnXy-U-34567 "
      should be_valid
      expect(@used_car.send(:obfuscated_stock_reference)).to eq("AERDNCX2Y1-BUA3")
    end

  end

  describe "when car_num is of length 8" do

    it "should have correct obfuscated_stock_reference" do
      @used_car.car_num = " AB12CDEF "
      @used_car.car_ref = " ARNXY-U-45678 "
      should be_valid
      expect(@used_car.send(:obfuscated_stock_reference)).to eq("AFRENDXCY2-1UB-A4")
    end

    it "should, regardless of case, have correct obfuscated_stock_reference" do
      @used_car.car_num = " ab12CDEF "
      @used_car.car_ref = " aRnXy-U-45678 "
      should be_valid
      expect(@used_car.send(:obfuscated_stock_reference)).to eq("AFRENDXCY2-1UB-A4")
    end

  end

end
