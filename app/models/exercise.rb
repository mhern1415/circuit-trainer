class Exercise < ApplicationRecord
  belongs_to :user
  has_many :circuits
  has_many :workouts, through: :circuits 

  validates :reps, :category, :name, presence: true

  scope :most_used, -> { Exercise.left_joins(:circuits).group(:id).order("count(circuits.exercise_id) desc") }

end
