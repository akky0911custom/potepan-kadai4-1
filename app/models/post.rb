class Post < ApplicationRecord
  validates :title, {presence: true, length: {maximum: 20}}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: {maximum: 500}
  validate :date_before_end

  def date_before_end
    if start_date.present? && self.end_date.present? && start_date > self.end_date
      errors.add(:end_date, "は開始日以降のものを選択してください") 
    end
  end
end
