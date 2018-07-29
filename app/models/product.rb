class Product < ApplicationRecord
    has_many :variants, dependent: :destroy
    #% has_one_attached ile resim tablosuyla bağlantı verdik. image ile ulaşım sağladık. ( product.image )
    has_many_attached :images

    accepts_nested_attributes_for :variants

    validates :name, presence: true, length: {minimum:3}

    ## Link yapısını 1-kemal-aydin yaptık, parametirize bizim için slug yapısı oluşturuyoru
    def to_param
        "#{id}-#{name.parameterize}"
    end
    
end
