class Spot < ApplicationRecord
    has_one_attached :image
    
    validates :name, presence: true, length: { maximum: 50 }
    validates :address, presence: true, length: { maximum: 100 }
    validates :description, presence: true, length: { maximum: 255 }
end
