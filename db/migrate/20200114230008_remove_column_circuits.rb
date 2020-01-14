class RemoveColumnCircuits < ActiveRecord::Migration[6.0]
  def change
    remove_column :workouts, :circuits, :integer
  end
end
