class Workout < ApplicationRecord
    belongs_to :user
    has_many :circuits
    has_many :exercises, through: :circuits 

    validates :title, :description, :circuits, presence: true
    validates :circuits, numericality: { message: "%{value} must be a number" } 
    
    validate :not_a_duplicate

    def not_a_duplicate
        if Workout.find_by(title: title, circuit_count: circuit_count, description: description, user_id: user_id)
          errors.add("race", "has already been used - this race has already been created")
        end
      end

    
end
