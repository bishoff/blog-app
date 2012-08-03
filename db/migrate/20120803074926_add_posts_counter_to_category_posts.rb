class AddPostsCounterToCategoryPosts < ActiveRecord::Migration
  def self.up
   
    remove_column :category_posts, :posts_counter

  end
end
