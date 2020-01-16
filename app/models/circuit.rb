class Circuit < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise

  scope :by_exercise, -> (exercise_id) {where("exercise_id = ?", exercise_id)}

  validates :date, presence: true
  #accepts_nested_attributes_for :exercise 
  def exercise_attributes=(exercise_params)
    exercise = Exercise.find_or_create_by(exercise_params)
    if exercise.valid?
      self.exercise = exercise
    end
  end

end
