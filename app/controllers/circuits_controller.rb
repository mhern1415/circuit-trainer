class CircuitsController < ApplicationController

def index
end

def show
    @circuit = Circuit.find_by(id: params[:id])
end

def new
    @circuit = Circuit.new
    @circuit.build_exercise
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
    params.require(:circuit).permit(:date, :category, :workout_id, :exercise_id, exercise_attributes:[:name, :category, :reps])
end

end
