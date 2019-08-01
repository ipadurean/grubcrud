class OrderItemsController < ApplicationController
  
  def new 
  end

  def create
    @order = current_order
    @order_item = @order.order_items.new(item_params)
      if @order_item.valid?
          @order_item.save
          redirect_to cart_path
    else 
      flash[:error] = "Your item/s could not be saved"
      redirect_to root_path
    end
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  def show
    @order_item = OrderItem.find
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :item_id)
  end
  
end
