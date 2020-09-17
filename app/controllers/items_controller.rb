class ItemsController < ApplicationController
before_action :set_item, except: [:index, :new, :create]

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


  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :condition_id, :payer_id, :preparation_day_id, :prefecture_id, images_attributes: [:url, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
  def set_item
    @item =Item.find(params[:id])
  end

  def purchase
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
      amount: @item.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end



end


# includes(:images).order('created_at DESC')