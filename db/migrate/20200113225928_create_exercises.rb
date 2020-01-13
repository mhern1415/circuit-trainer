class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :category
      t.integer :reps
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
