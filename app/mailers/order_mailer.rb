class OrderMailer < ActionMailer::Base
  def to_client(order)
    @order = order
    mail to: order.client_email, subject: "Вы сделали заказ услуги на Team Days", from: 'formaildelivery@gamil.com'
  end

  def to_partner(partner, order)
    @order = order
    mail to: partner.email, subject: 'Новый заказ на Team Days', from: 'formaildelivery@gamil.com'
  end
end