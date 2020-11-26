class ItemsController < ApplicationController
  def destroy
    @item = Item.find(params[:id])
    @receipt = @item.receipt
    @item.destroy

    redirect_to receipt_path(@receipt)
  end
end
