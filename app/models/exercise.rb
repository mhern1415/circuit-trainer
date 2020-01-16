class Exercise < ApplicationRecord
  belongs_to :user
  has_many :circuits
  has_many :workouts, through: :circuits 

  validates :name, :reps, presence: true

end
