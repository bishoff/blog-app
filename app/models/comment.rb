class Comment < ActiveRecord::Base
  attr_accessible :comment, :title, :user_id, :commentable_id, :commentable_type

  validates :comment, :presence => true
  validates :user_id, :presence => true
   
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many   :comments,    :as => :commentable, :dependent => :destroy

  def after_create
    @post = comments_post(self)
    @post.update_attribute(:comments_counter, @post.comments_counter + 1)
  end

  def after_destroy
    @post = comments_post(self)
    @post.update_attribute(:comments_counter, @post.comments_counter - 1)
  end

  def comments_post(comment)
    if comment.commentable_type  == "Post"
      return comment.commentable
    else
      return comments_post(comment.commentable)
    end
  end
end
