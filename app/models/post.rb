class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :category_ids

  validates :user_id, :presence => true
  validates :title,   :presence => true
  validates :content, :presence => true

  belongs_to :user
  has_many :category_posts, :dependent => :destroy
  has_many :categories, :through => :category_posts
  has_many :comments, :as => :commentable, :dependent => :destroy 
end