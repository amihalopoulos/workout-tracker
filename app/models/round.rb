class Round < ActiveRecord::Base
  belongs_to :exercise

  def one_rep_average
    (self.weight*(1/(1.0278-(self.reps*0.0278)))).round
  end
end