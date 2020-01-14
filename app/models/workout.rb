class Workout < ApplicationRecord
    belongs_to :user
    has_many :circuits
    has_many :exercises, through: :circuits 

    validates :title, :description, :circuits, presence: true
    validates :circuits, numericality: { message: "%{value} must be a number" } 
    
    validate :not_a_duplicate

    
end
