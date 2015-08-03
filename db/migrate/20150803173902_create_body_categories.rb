class CreateBodyCategories < ActiveRecord::Migration
  def change
    create_table :body_categories do |t|
      t.string :name
    end
  end
end
