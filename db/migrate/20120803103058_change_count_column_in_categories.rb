class ChangeCountColumnInCategories < ActiveRecord::Migration
  def up
    change_column :categories, :count, :integer, :default => 0
  end

  def down
  end
end
