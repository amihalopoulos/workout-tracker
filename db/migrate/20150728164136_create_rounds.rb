class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :reps, null: false
      t.integer :weight, null: false
      t.references :exercise, null: false
    end
  end
end
