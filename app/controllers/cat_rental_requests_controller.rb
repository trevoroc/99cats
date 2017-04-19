class CatRentalRequestsController < ApplicationController

  def new
    @cats = Cat.all
    render :new
  end

  def create
    @rental = CatRentalRequest.new(cat_rental_params)
    if @rental.save
      redirect_to cat_url(@rental.cat_id)
    else
      render :new
    end
  end

  private

  def cat_rental_params
    params.require(:rental).permit(:cat_id, :start_date, :end_date)
  end
end
