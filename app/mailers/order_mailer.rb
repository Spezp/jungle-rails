class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_email(order)

    @email_from_order = order.email
    @order = order
    puts "hello"
    mail(to: @email_from_order, subject: ' Welcome to awesome email')
  end

end
