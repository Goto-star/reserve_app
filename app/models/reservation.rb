class Reservation < ApplicationRecord
    belongs_to :room, optional: true
    belongs_to :user
    
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :number_of_people, presence: true, numericality: { only_integer: true, greter_than: 0 }
    
    validate :start_date_check
    validate :end_date_check
    
    def start_date_check
        errors.add(:start_date, "は今日以降の日付で入力してください") if start_date.nil? || start_date < Date.today
    end
    
    def end_date_check
        errors.add(:end_date, "は開始日より後の日付を入力してください") if end_date.nil? || start_date >= end_date
    end
end
