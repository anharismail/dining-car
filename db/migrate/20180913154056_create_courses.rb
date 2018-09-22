# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title

      t.timestamps
    end

    add_reference :recipes, :course, index: true
  end
end
