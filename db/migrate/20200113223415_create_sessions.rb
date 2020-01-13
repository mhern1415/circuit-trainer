class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :title
      t.integer :circuits
      t.string :description

      t.timestamps
    end
  end
end
