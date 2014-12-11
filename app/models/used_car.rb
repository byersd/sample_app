class UsedCar

  include ActiveModel::Model

  attr_accessor :car_num
  attr_accessor :car_ref

  VALID_CAR_NUM_LENGTH = 23
  VALID_CAR_REF_LENGTH = 23
  VALID_CAR_NUM_REGEX  = /\A[A-Za-z0-9]*\z/
  VALID_CAR_REF_REGEX  = /\A[A-Za-z0-9]*\z/

  validates :car_num,
    presence: true,
    length: { maximum: VALID_CAR_NUM_LENGTH },
    format: { with: VALID_CAR_NUM_REGEX }
  validates :car_ref,
    presence: true,
    length: { maximum: VALID_CAR_REF_LENGTH },
    format: { with: VALID_CAR_REF_REGEX }

  def initialize(attributes = {})
    @car_num = attributes[:car_num]
    @car_ref = attributes[:car_ref]
  end

  def display_car_num
    get_display_car_num(@car_num)
  end

  def display_car_ref
    get_display_car_ref(@car_ref)
  end

private

  def get_display_car_num(car_num)
    "This is the car num : <#{car_num}>"
  end

  def get_display_car_ref(car_ref)
    "This is the car ref : <#{car_ref}>"
  end

end
