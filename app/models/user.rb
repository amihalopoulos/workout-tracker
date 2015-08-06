class User < ActiveRecord::Base
  has_secure_password
  has_many :workouts
  has_many :exercises

  def worked_out_this_day(day)
    self.workouts.where(date: day).count > 0 ? true : false
  end

  def find_current_streak
    return 0 unless self.worked_out_this_day(Date.today - 1)
    streak = 0
    while self.worked_out_this_day(Date.today - (streak + 1))
      streak += 1
    end
    streak += 1 if self.worked_out_this_day(Date.today)
    return streak
  end
end