class CommentsController < ApplicationController
  
  def edit
    @comment = Comment.find(params[:id])
    render(:action => 'edit')
  end
  
  def update
    @comment = Comment.find(params[:id])
    c_name   = @comment.commentable_type.tableize.pluralize
    oligo_id = @comment.commentable_id
    
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Comment was successfully updated.'
      redirect_to :controller => c_name, :action => :show, :id => oligo_id
    else
      redirect_to :back 
    end
  end

  
  def destroy
    @comment = Comment.find(params[:id])
    c_name = @comment.commentable_type.tableize.pluralize
    oligo_id = @comment.commentable_id

    @comment.destroy
    flash[:notice] = 'Comment deleted'
    redirect_to :controller => c_name, :action => :show, :id => oligo_id
  end
