require 'open-uri'

class ReceiptsController < ApplicationController
  def show
    @receipt = Receipt.find(params[:id])
    @trip = @receipt.trip
    @item = Item.new
  end

  def upload_photo
    @trip = Trip.find(params[:trip_id])
    @receipt = Receipt.new
  end

  def create_photo
    @receipt = Receipt.new(receipt_params)
    @trip = Trip.find(params[:trip_id])
    @user = current_user
    @receipt.trip = @trip
    @receipt.user = @user

    if @receipt.save
      redirect_to edit_photo_receipt_path(@receipt)
    else
      render :upload_photo
    end
  end

  def edit_photo
    find_receipt
    @data = OcrService.new.detect_text(URI.open(@receipt.photo.service_url))
    @receipt.update(@data)
  end

  def update_photo
    update
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @trip = Trip.find(params[:trip_id])
    @user = current_user
    @receipt.trip = @trip
    @receipt.user = @user

    if @receipt.save
      redirect_to receipt_path(@receipt)
      # redirect_to edit_photo_receipt_path(@receipt)
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

  def find_receipt
    @receipt = Receipt.find(params[:id])
  end

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def receipt_params
    params.require(:receipt).permit(:shop, :shop_vat_no, :shop_address,
      :transaction_no, :date, :total, :total_excl_vat, :photo)
  end
end
