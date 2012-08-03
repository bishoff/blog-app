class CategoryPost < ActiveRecord::Base
  attr_accessible :category_id, :post_id, :count

  belongs_to :post
  belongs_to :category

  after_create :post_counter_increment
  after_destroy :post_counter_decrement

  def post_counter_increment
    Category.find(self.category_id).update_attribute(:count, category.count + 1)
  end
  def post_counter_decrement
    Category.find(self.category_id).update_attribute(:count, category.count - 1)
  end
end
