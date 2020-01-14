class Workout < ApplicationRecord
    belongs_to :user
    has_many :circuits
    has_many :exercises, through: :circuits 

end
