class DropExamplesses < ActiveRecord::Migration
  def change
    drop_table :examplesses
  end
end
