class User < ApplicationRecord
    has_many :created_exercises, foreign_key: "user_id", class_name: "Exercise"
    has_many :workouts
    has_many :completed_exercises, through: :workouts, source: :exercises
    has_many :circuits, through: :workouts
end
