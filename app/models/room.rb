class Room < ApplicationRecord
    belongs_to :user
    
    validates :name,presence: true
    validates :introduction,presence: true
    validates :price,presence: true
    validates :address,presence: true

    mount_uploader :img, ImgUploader
end
