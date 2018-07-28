# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def welcome
        #% Yukarıdaki linkten görünüşüne bakabiliyoruz.
        UserMailer.with(product: Product.first).welcome
    end
end
