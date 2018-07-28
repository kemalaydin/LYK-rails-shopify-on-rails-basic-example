class Variant < ApplicationRecord
  belongs_to :product

  # @param email 
  def send_gift (email)
    #% Mail Gönderme aksiyonunu ateşleme (Deliver_later komutu ile jobs tanımlanıyor);
    GiftMailer.with(product: product,email: email).send_gift.deliver_later if decrement!(:stock)
    puts "Mail Sending for #{email}"
  end
  
end
