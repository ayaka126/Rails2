class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reserved_rooms, through: :reservations, source: :room
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
