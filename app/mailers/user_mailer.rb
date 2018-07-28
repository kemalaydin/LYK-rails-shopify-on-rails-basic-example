class UserMailer < ApplicationMailer
    #% view içerisinde user_mailers açıldı oradaki welcome view ile tasarıma dataları bastırıp gönderiyoruz.

    def welcome ()
        @product = params[:product]
        mail(to: 'kmlcanaydin@gmail.com', subject: 'Hello')
    end
end
