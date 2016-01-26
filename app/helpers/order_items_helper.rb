module OrderItemsHelper
	def summ
    	summ = order_item.quantity*order_item.price
  	end
end
