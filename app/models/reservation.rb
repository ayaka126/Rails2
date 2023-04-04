class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :check_in ,presence:true
    validates :check_out ,presence:true
    validates :how_many_people ,presence:true
    validate :start_end_check

    def start_end_check
        return false if check_in.blank? || check_out.blank?
        if check_in > check_out
            errors.add(:check_out, "はチェックイン日以降の日付を選択してください")
        end
    end

    def how_many_days
        (check_out.to_date - check_in.to_date).to_i
    end

    def total_price
        (how_many_people * how_many_days * room.price).to_i
    end
end
