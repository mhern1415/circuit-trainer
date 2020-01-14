class AddCircuitCountToWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_column :workouts, :circuit_count, :integer
  end
end