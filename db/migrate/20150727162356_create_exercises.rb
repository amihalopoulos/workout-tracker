class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.text :name, null: false
      t.references :workout, null: false

    end
  end
end
