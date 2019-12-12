class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :spot, optional: true
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
end
