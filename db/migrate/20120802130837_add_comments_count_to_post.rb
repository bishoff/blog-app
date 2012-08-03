class AddCommentsCountToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :comments_counter, :integer
  end
  def self.down
    remove_column :posts, :comments_counter
  end
end