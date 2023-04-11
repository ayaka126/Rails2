class Room < ApplicationRecord
    mount_uploader :img, ImgUploader
    belongs_to :user
    has_many :reservations, dependent: :destroy
    
    validates :name,presence: true
    validates :introduction,presence: true
    validates :price,presence: true
    validates :address,presence: true

    def reserved_by?(user)
        reservations.where(user_id:user.id).exsists?
    end

end
