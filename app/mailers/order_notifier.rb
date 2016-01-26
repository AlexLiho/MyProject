class OrderNotifier < ActionMailer::Base

  default from: 'Сервис заказа Bjic.ru<address@bjic.ru>' #'<Сервис ророр>Bjic.ru'

  def feedback(order_id)
    
    @order = Order.find(order_id)
    @order_items = @order.order_items
    # binding.pry
    mail to: ['qaz3891@ya.ru', 'kraftwerk@list.ru'], subject: 'Feedback message from Bjic.ru' #do |format|
    #   format.text(content_transfer_encoding: "base64")
    #   format.html
    # end	
  end
end
