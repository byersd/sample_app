class UsedCarsController < ApplicationController

  def index
    @used_car = UsedCar.new
  end

  def search
    @used_car = UsedCar.new(used_car_params)

    if @used_car && @used_car.valid?
      flash.now[:success] = "success!"
      render 'index'
    else
      render 'index'
    end
  end

private

  def used_car_params
    params.require(:used_car).permit(:car_num , :car_ref)
  end

end
