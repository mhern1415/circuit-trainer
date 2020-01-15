class WorkoutsController < ApplicationController


  def index
    @workouts = current_user.workouts
  end

  def show
    @workout = Workout.find_by(id: params[:id])
  end


  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to workout_path(@workout)
    else
      render :new
    end
  end

  def edit
    @workout = Workout.find_by(id: params[:id])
  end

  def update
    @workout = Workout.find_by(id: params[:id])
    if @workout.update(workout_params)
      redirect_to workout_path(@workout)
    else
      render :edit
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:title, :circuit_count, :description)
  end

end
