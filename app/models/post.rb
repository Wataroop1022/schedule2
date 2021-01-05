class Post < ApplicationRecord
  validates :title, presence:true, length:{maximum: 20}
  validates :day_start, :day_end, presence:true
  validate  :date_not_before_today

  def date_not_before_today
      errors.add(:day_end, "は今日以降のものを選択してください") if day_end.nil? ||day_end < Date.today
  end
end
