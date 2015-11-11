class CreateExamplesses < ActiveRecord::Migration
  def change
    create_table :examplesses do |t|
      t.string :stuff

      t.timestamps null: false
    end
  end
end
