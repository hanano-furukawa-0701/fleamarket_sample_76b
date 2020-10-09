class CommentsController < ApplicationController
 
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.any
        format.html { redirect_to item_path(params[:item_id]) }
        format.json { render json: @comment}
      end
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    comment = Comment.find_by(id: params[:id], item_id: params[:item_id])
    comment.destroy
    redirect_to item_path(params[:item_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end
