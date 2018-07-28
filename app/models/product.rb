class Product < ApplicationRecord
    has_many :variants, dependent: :destroy
    #% has_one_attached ile resim tablosuyla bağlantı verdik. image ile ulaşım sağladık. ( product.image )
    has_one_attached :image

    accepts_nested_attributes_for :variants

    validates :name, presence: true, length: {minimum:3}
    validates :price, presence: true, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }

    ## Link yapısını 1-kemal-aydin yaptık, parametirize bizim için slug yapısı oluşturuyoru
    def to_param
        "#{id}-#{name.parameterize}"
    end
    
end
