class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    # @posts = Post.all
    @posts = Post.order("title").page(params[:page]).per(5)
  end
 
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
 
  def new
    @post = Post.new
  end
 
  def edit
    @post = Post.find(params[:id])
  end
 
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    @post.save ? redirect_to(@post, :notice => 'Post was successfully created.') : render(:action => "new")
  end
 
  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post]) ? redirect_to(@post, :notice => 'Post was successfully updated.') : (render :action => "edit")
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy and redirect_to(posts_url)
  end
end
