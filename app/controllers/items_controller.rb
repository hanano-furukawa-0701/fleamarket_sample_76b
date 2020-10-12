class ItemsController < ApplicationController
before_action :access_restrictions, except: [:index, :show]
before_action :set_card, only: [:purchase, :pay]
before_action :set_item, only:[:show, :destroy, :edit, :update, :purchase, :pay]


  def index
    @items = Item.includes(:images).limit(5).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil)
  end
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    # ここでfind_byを使うことでレディーしか取れてなかった
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
     
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.order(created_at: :desc)
  end


  def update
    if @item.update(item_params)
      redirect_to root_path
      flash[:notice] = "更新しました"
    else 
    j  render:edit
      flash[:notice] = "更新できませんでした"
    end
  end


  def destroy
    if current_user.id ==@item.user_id && @item.destroy
      redirect_to root_path
      flash[:notice] = '商品を削除しました'
    else
      render :edit
      flash[:alert] = '商品が削除できませんでした'
  end
end
    
  
  def edit
  end


  
  def purchase
    if @credit_card.present?
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)
      @default_card_infomation = customer.cards.retrieve(@credit_card.card_id)
    end
    
  end

  def pay
    @credit_card = CreditCard.where(user_id: current_user.id).first
    if @item.buyer_id.present?
      redirect_to action: 'index'
    elsif @credit_card.blank?
      redirect_to controller: "credit_cards", action: "new"
      flash[:alert] = '購入にはクレジットカードが必要です'
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      Payjp::Charge.create(
        amount: @item.price,
        customer: @credit_card.customer_id,
        currency: 'jpy'
      )
      @item.update(buyer_id: current_user.id)
      redirect_to action: 'done'
    end 
  end

  def done
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :price, :condition_id, :payer_id, :preparation_day_id, :prefecture_id, images_attributes: [:url, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
  def access_restrictions
    unless user_signed_in?
      flash[:alert] = 'ログインが必要です' 
      redirect_to new_user_session_path 
    end
  end

  def set_item
    @item =Item.find(params[:id])
  end
  

  def set_card
    @credit_card = CreditCard.where(user_id: current_user.id).first
  end

end
