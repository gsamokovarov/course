class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.belongs_to :lecture, foreign_key: true, index: true, null: false

      t.timestamps null: false
    end
  end
end
