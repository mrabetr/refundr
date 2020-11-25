class ItemsController < ApplicationController

	def new
		@receipt = Receipt.find(params[:receipt_id])
		@item = Item.new
	end

	def create
		@receipt = Receipt.find(params[:receipt_id])
		@item = Item.new(item_params)
		@item.receipt = @receipt

		if @item.save
			redirect_to receipt_path(@receipt), notice: 'Item was successfully added'
		else
			render :new
		end
	end

	def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to receipt_path(@item.receipt), notice: 'Item was successfully updated'
    else
      render :edit
    end
  end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to receipt_path(@item.receipt)
	end

	private

  def item_params
    params.require(:item).permit(:quantity, :description, :price_cents, :receipt_id, :photo)
  end

end
