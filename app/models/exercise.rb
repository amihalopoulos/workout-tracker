class Exercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :user
  has_many :rounds

  def get_one_rep_dataset
    exercises = Exercise.where(name: self.name, user_id: self.user_id)
    dataset= []
    exercises.each do |exercise|
      array_of_avgs = []
      exercise.rounds.each do |round|
        array_of_avgs << round.one_rep_average
      end
      one_rep_max = (array_of_avgs.inject{ |sum, el| sum + el }.to_f / array_of_avgs.size)
      dataset << [one_rep_max, exercise.workout.date]
    end
    return dataset
  end

end