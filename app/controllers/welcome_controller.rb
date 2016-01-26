class WelcomeController < ApplicationController

  def index
    @page_title = 'Bjic: быстрая, качественная и недорогая уборка Вашего дома'
  end

  def calculate
    @page_title = 'Заказать уборку'

    #binding pry
    @general_products = Product.where(additional: false).order(:visible_order)
    @additional_products = Product.where(additional: true).order(:visible_order)
  end  

  def confirmation

    @order = Order.new(request_params)
    # binding.pry
    respond_to do |format|
      if @order.save
        general_product_id = params[:order][:product_id]
        OrderItem.create!(product_id: general_product_id, order_id: @order.id, quantity: 1, price: Product.find(general_product_id).price)
        params[:order_item].each do |key, value|  
          if value[:quantity].to_i != 0 
            OrderItem.create!(product_id: key, order_id: @order.id, quantity: value[:quantity], price: Product.find(key).price, additional: true)
          end  
        end  
     # Сформировали или получили от клиента данные для отправки
        OrderNotifier.feedback(@order.id).deliver_now
        format.html { redirect_to root_path, notice: 'Ваш заказ успешно создан! Ожидайте звонка оператора.' }
      else
        format.html { render :calculate }
      end
    end
  end  

  def about 
    @page_title = 'Наши контакты'
  end  

  private

      # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:order).permit(:name, :email, :phone, :variant, :eco, :get_key)
    end


end
