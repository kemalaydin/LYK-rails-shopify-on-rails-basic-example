class Product < ApplicationRecord
    has_many :variants, dependent: :destroy

    validates :name, presence: true
    validates :price, presence: true, length: {minimum:3}
    
end
