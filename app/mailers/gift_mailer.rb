class GiftMailer < ApplicationMailer
    def send_gift
        @product = params[:product]
        mail(to: params[:email], subject: 'Yey! You have a gift' )
    end
end
