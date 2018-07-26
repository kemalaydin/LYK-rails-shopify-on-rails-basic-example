class Product < ApplicationRecord
    has_many :variants, dependent: :destroy

    validates :name, presence: true, length: {minimum:3}
    validates :price, presence: true, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
    
end
