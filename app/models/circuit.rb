class Circuit < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise
  
  accepts_nested_attributes_for :exercise 
end
