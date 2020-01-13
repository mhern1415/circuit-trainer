class Workout < ApplicationRecord
    has_many :circuits
    has_many :exercises, through: :circuits 

end
