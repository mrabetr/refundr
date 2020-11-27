class ItemsController < ApplicationController
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @receipt = @item.receipt

    if @item.update(item_params)
      redirect_to receipt_path(@receipt)
    else
      render :edit
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @receipt = @item.receipt
    @item.destroy

    redirect_to receipt_path(@receipt)
  end

  private

  def item_params
    params.require(:item).permit(:quantity, :description, :price)
  end
end
