class CommentsController < ApplicationController
  # GET /comments/new
  # GET /comments/new.json
  # def new
  #   @comment = Comment.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @comment }
  #   end
  # end

  def new
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  # def create
  #   @comment = Comment.new(params[:comment])

  #   respond_to do |format|
  #     if @comment.save
  #       format.html { 
  #         # redirect_to @comment, notice: 'Comment was successfully created.' 
  #         redirect_to(post_path(params[:post_id]), :notice => 'Comment was successfully created.')
  #       }
  #     else
  #       format.html { 
  #         # render action: "new" 
  #         redirect_to(post_path(params[:post_id]), :notice => 'Error! Comment was\'nt created.')
  #       }
  #     end
  #   end
  # end
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to(post_path(params[:post_id]), :notice => 'Comment was successfully created.')
    else
      redirect_to(post_path(params[:post_id]), :notice => 'Error! Comment was\'nt created.')
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment.post, notice: 'Comment was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    
    redirect_to(post_path(params[:post_id]))
  end
end
