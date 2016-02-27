class CreateLecture < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.text :body
      t.string :name
    end
  end
end
