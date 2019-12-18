class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.new_order.subject
  #
  def new_order(order)
    @greeting = "Hi"
    @order = order
    mail to: order.email,
         subject: "Your Jungle Order Summary: Order ##{order.id}"
  end
end
