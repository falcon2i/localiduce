class Item < ApplicationRecord
  mount_uploader :picture, PictureUploader
  
  include JpPrefecture
  jp_prefecture :prefecture_code
  
  belongs_to :user
  
  validates :user_id, presence: true
  validates :area, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
  #validates :picture, presence: true, length: { maximum: 255 }
  
end
