class ChangeDefaultValueCountColumnInCategories < ActiveRecord::Migration
  def up
    old = Category.where(:count => nil).update_all(:count => 0)
    # old = Category.where(:count => nil).update_all(:count => 0)
    old.each do |x|
      x.update_attribute(:count, 0)
    end
  end

  def down
  end
end
