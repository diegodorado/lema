class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :category
      t.string :title
      t.text :body
      t.text :specification
      t.text :objective
      t.text :summary

      t.timestamps
    end
  end
end
