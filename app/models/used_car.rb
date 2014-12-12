class UsedCar

  include ActiveModel::Model

  attr_accessor :car_num
  attr_accessor :car_ref

  BASE_IMAGE_URL = "http://vcache.arnoldclark.com/imageserver/%{obfuscated_stock_reference}/%{size}/%{camera}"

  MIN_CAR_NUM_LENGTH = 5
  MIN_CAR_REF_LENGTH = 10
  MAX_CAR_NUM_LENGTH = 10
  MAX_CAR_REF_LENGTH = 20
  VALID_CAR_NUM_REGEX  = /\A[A-Za-z0-9\s\-]*\z/
  VALID_CAR_REF_REGEX  = /\A[A-Za-z0-9\s\-]*\z/

  validates :car_num,
    presence: true,
    length: { minimum: MIN_CAR_NUM_LENGTH , maximum: MAX_CAR_NUM_LENGTH },
    format: { with: VALID_CAR_NUM_REGEX }
  validates :car_ref,
    presence: true,
    length: { minimum: MIN_CAR_REF_LENGTH , maximum: MAX_CAR_REF_LENGTH },
    format: { with: VALID_CAR_REF_REGEX }

  def initialize(attributes = {})
    @car_num = attributes[:car_num]
    @car_ref = attributes[:car_ref]
  end

  def image_urls

    urls = []

    osr = obfuscated_stock_reference

    SIZE_VALUES.each do |size|
      CAMERA_VALUES.each do |camera|
        urls << BASE_IMAGE_URL % { :obfuscated_stock_reference => osr , :size => size , :camera => camera }
      end
    end

    return urls

  end

private

  SIZE_VALUES = ["350",
                 "800"]

  CAMERA_VALUES = ["f",
                   "r",
                   "i",
                   "4",
                   "5",
                   "6"]

  def obfuscated_stock_reference

    # remove all whitespace from @car_num.
    stripped_car_num = @car_num.gsub(/\s+/ , "")

    # remove all whitespace from @car_ref.
    stripped_car_ref = @car_ref.gsub(/\s+/ , "")

    # take .reverse of stripped_car_num, and convert to char array.
    char_array_car_num = stripped_car_num.reverse.split("")

    # take [0 ... stripped_car_num.length] of stripped_car_ref, and convert to char array.
    char_array_car_ref = stripped_car_ref[0 ... stripped_car_num.length].split("")

    # interleave char arrays, flatten resulting 2D array to 1D array, combine elements to form string, append char from stripped_car_ref, and convert to uppercase.
    char_array_car_ref.zip(char_array_car_num).flatten.join.concat(stripped_car_ref[8]).upcase

  end

end
