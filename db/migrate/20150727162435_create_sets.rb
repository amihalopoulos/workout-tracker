class CreateSets < ActiveRecord::Migration
  def change
    create_table :sets do |t|
      t.integer :reps, null: false
      t.integer :weight, null: false
      t.references :exercise, null: false
    end
  end
end
