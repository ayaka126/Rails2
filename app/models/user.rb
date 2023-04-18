class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reserved_rooms, through: :reservations, source: :room
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
