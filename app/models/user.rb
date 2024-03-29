class User < ApplicationRecord
  has_many :rooms
  has_many :reservations
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  mount_uploader :image, ImageUploader
end
