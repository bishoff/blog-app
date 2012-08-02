class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  validates :user_id, :presence => true
  validates :title,   :presence => true
  validates :content, :presence => true

  belongs_to :user
  has_many :category_posts, :dependent => :destroy
  has_many :categories, :through => :category_posts
end
