# Preview all emails at http://localhost:3000/rails/mailers/gift_mailer
class GiftMailerPreview < ActionMailer::Preview
    def send_gift
        GiftMailer.with(product: Product.first, variant: Variant.find(2),email: 'kmlcanaydin@gmail.com').send_gift
    end
end
