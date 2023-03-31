class Reservation < ApplicationRecord
    validates :check_in ,presence:true
    validates :check_out ,presence:true
    validates :how_many_people ,presence:true
    validate start_end_check

    def start_end_check
        return false if check_in.blank? || check_out.blank?
        if check_in > check_out
            errors.add(:check_out"はチェックイン日以降の日付を選択してください")
        end
    end
end
