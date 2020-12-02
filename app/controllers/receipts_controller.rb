require 'open-uri'

class ReceiptsController < ApplicationController
  def show
    @receipt = Receipt.find(params[:id])
    @trip = @receipt.trip
    @item = Item.new

    @total = 0
    @items = 0
    @receipt.items.each do |item|
      @total += item.price
      @items += 1
    end
    @saving = @total / 6.0
  end

  def new_photo
    @trip = Trip.find(params[:trip_id])
    @receipt = Receipt.new
  end

  def create_photo
    @receipt = Receipt.new(receipt_params)
    @trip = Trip.find(params[:trip_id])
    @user = current_user
    @receipt.trip = @trip
    @receipt.user = @user
    @receipt.date = Date.today

    if @receipt.save
      @data = OcrService.new.detect_text(URI.open(@receipt.photo.service_url))
      @receipt.update(@data)
      redirect_to edit_photo_receipt_path(@receipt)
    else
      render :new_photo
    end
  end

  def edit_photo
    find_receipt
  end

  def update_photo
    find_receipt
    total = 0
    @receipt.items.each do |item|
      total += item.price
    end
    @receipt.total = total
    @receipt.total_excl_vat = total / 1.2
    if @receipt.update(receipt_params)
      redirect_to receipt_path(@receipt)
    else
      render :edit_photo
    end
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @receipt = Receipt.new; @receipt.items.build
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @trip = Trip.find(params[:trip_id])
    @user = current_user
    @receipt.trip = @trip
    @receipt.user = @user
    total = 0
    @receipt.items.each do |item|
      total += item.price
    end
    @receipt.total = total
    @receipt.total_excl_vat = total / 1.2
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
    total = 0
    @receipt.items.each do |item|
      total += item.price
    end
    @receipt.total = total
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
      :transaction_no, :date, :total, :total_excl_vat, :photo, items_attributes: [:id, :quantity, :description, :price])
  end
end
