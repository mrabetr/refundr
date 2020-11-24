class ReceiptsController < ApplicationController
  def show
    @receipt = Receipt.find(params[:id])
    @trip = @receipt.trip
    @item = Item.new
  end

  def new
    @receipt = Receipt.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @trip = Trip.find(params[:trip_id])
    @user = current_user
    @receipt.trip = @trip
    @receipt.user = @user

    if @receipt.save
      redirect_to receipt_path(@receipt)
    else
      render :new
    end
  end

  def edit
    @receipt = Receipt.find(params[:id])
  end

  def update
    @receipt = Receipt.find(params[:id])

    if @receipt.update(receipt_params)
      redirect_to receipt_path(@receipt)
    else
      render :edit
    end
  end

  def destroy
    @receipt = Receipt.find(params[:id])
    @trip = @receipt.trip
    @receipt.destroy

    redirect_to trip_path(@trip)
  end

  private

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def receipt_params
    params.require(:receipt).permit(:shop, :shop_vat_no, :shop_address,
      :transaction_no, :date, :total, :total_excl_vat)
  end

end
