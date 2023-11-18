class Post < ApplicationRecord
  validates :title, {presence: true, length: {maximum: 20}}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: {maximum: 500}
  validate :start_date_check

  def start_date_check
      if start_date.present? && self.end_date.present? && start_date > self.end_date
        errors.add(:start_date, "を終了日以降に日付指定することは出来ません")
      end
  end
end
