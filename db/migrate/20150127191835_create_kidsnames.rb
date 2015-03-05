class CreateKidsnames < ActiveRecord::Migration
  def change
    create_table :kidsnames do |t|
      t.string :name
      t.string :gender
      t.integer :rank
      t.integer :score

      t.timestamps
    end
  end
end
