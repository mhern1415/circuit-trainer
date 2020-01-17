class Exercise < ApplicationRecord
  belongs_to :user
  has_many :circuits
  has_many :workouts, through: :circuits 

  validates :reps, presence: true

end
