class CommentsController < ApplicationController
 
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(params[:item_id]) 
      flash[:notice] = "コメントを追加しました"
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    comment = Comment.find_by(id: params[:id], item_id: params[:item_id])
    comment.destroy
    redirect_to item_path(params[:item_id])
    flash[:notice] = "コメントを削除しました"
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end
