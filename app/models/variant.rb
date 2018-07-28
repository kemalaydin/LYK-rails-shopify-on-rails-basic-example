class Variant < ApplicationRecord
  belongs_to :product

  # @param email 
  def send_gift (email)
    if(decrement!(:stock))
            #% Mail Gönderme aksiyonunu ateşleme ;
            #GiftMailer.with(product: product,variant: variant,email: email).send_gift
            puts "Mail Sending for #{email}"
    end
  end
  
end
