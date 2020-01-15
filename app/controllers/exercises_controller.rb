class ExercisesController < ApplicationController

def index
    @exercise = Exercise.all 
end

def show
    @exercise = Exercise.find_by(id: params[:id])
end

def new
    @exercise = Exercise.new
end

def create
   
    @exercise = current_user.created_exercises.new(exercise_params)
    
    if @exercise.save
        redirect_to exercise_path(@exercise)
    else
        render :new
    end
    
end

private

def exercise_params
    params.require(:exercise).permit(:name, :category, :reps, :user_id)
end

end
