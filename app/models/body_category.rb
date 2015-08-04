class BodyCategory < ActiveRecord::Base
  has_many :exercise_categories
end