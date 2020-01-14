class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :workouts, :circuits, :circuit_count
  end
end
