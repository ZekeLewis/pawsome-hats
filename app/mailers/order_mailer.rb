class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_confirmation.subject
  #
  
      default from: 'notifications@example.com'
    
      def order_confirmation(user, order)
        @user = user
        @order = order
        mail(to: @user.email, subject: 'Order Confirmation')
      end
    
  
end
