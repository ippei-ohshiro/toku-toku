class Spot < ApplicationRecord
  belongs_to :user
  #お気に入り機能追加用中間テーブル追加
  has_many :favorites, foreign_key: 'spot_id', dependent: :destroy
  has_many :users, through: :favorites
  has_one_attached :image
    
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 255 }
end
