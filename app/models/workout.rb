class Workout < ApplicationRecord
    belongs_to :user
    has_many :circuits
    has_many :exercises, through: :circuits 

    validates :title, :description, :circuit_count, presence: true
    
    scope :three_biggest_workouts, -> { order(circuit_count: :desc).limit(3)}

    
end
 