class ItemsController < ApplicationController

	def new
		@item = Item.new
	end

	def create
		@receipt = Receipt.find(params[:receipt_id])
		@item = Item.new(item_params)
		@item.receipt = @item

		if @item.save
			redirect_to receipt_path(@receipt)
		else
			render :new
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to receipt_path(@item.receipt)
	end

	private

  def item_params
    params.require(:item).permit(:quantity, :description, :receipt_id, :photo)
  end

end
