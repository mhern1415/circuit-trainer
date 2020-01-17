class ExercisesController < ApplicationController
    before_action :find_exercise, only: [:show]
    skip_before_action :require_login, only: [:index, :show]
def index
    @exercises = Exercise.most_used
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

def find_exercise
    @exercise = Exercise.find_by(id: params[:id])
    redirect_to exercises_path if !@exercise
end

end
