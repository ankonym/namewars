class AddCountColumnToKidsnames < ActiveRecord::Migration
  def change
    add_column :kidsnames, :count, :integer
  end
end
