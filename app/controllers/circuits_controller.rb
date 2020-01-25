class CircuitsController < ApplicationController
    before_action :find_circuit, only: [:show]
    skip_before_action :require_login, only: [:index]
def index
    if params[:exercise_id] && @exercise = Exercise.find_by_id(params[:exercise_id])
        #Exercise.find_by(id: params[:workout_id])
        @circuits = @exercise.circuits
    elsif params[:workout_id] && @workout = Workout.find_by_id(params[:workout_id])
        
        @circuits = @workout.circuits
    else
        @circuits = Circuit.all
    end
end

def show
    @circuit = Circuit.find_by(id: params[:id])
end

def new
    if params[:exercise_id] && @exercise = Exercise.find_by_id(params[:exercise_id])
        @circuit = @exercise.circuits.build 
    else
        @circuit = Circuit.new
        @circuit.build_exercise
    end
end

def create
    
    @circuit = Circuit.new(circuit_params)
    
    if @circuit.save
        redirect_to circuit_path(@circuit)
    else
        render :new
    end
    
end

private

def circuit_params
    params.require(:circuit).permit(:date, :category, :workout_id, :exercise_id, exercise_attributes:[:name, :category, :reps, :user_id])
end

def find_circuit
    @circuit = Circuit.find_by(id: params[:id])
    redirect_to circuits_path if !@circuit
end

end
