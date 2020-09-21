class ItemsController < ApplicationController
before_action :set_item, except: [:index, :new, :create]
before_action :set_card, only: [:purchase, :pay]

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
    redirect_to root_path
    else
      render :new
    end
  end

  def show
  end


  def update
    if @item.update(item_params)
      redirect_to root_path
    else 
      render:edit
    end
  end

  
  def edit
  end
    
  def destroy
  end
  
  def purchase
    if @credit_card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
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
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
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
    params.require(:item).permit(:name, :explanation, :price, :condition_id, :payer_id, :preparation_day_id, :prefecture_id, images_attributes: [:url, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
  def set_item
    @item =Item.find(params[:id])
  end

  def set_card
    @credit_card = CreditCard.where(user_id: current_user.id).first
  end




end


