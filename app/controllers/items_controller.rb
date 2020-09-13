#item_controller.rbの記述を作成
class ItemsController < ApplicationController

  
  def index
    @items = Item.includes(:images).order('created_at DESC')
>>>>>>> master
  end

  def new
    @item= Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to root_path
else
  render :new
end
end

before_action :set_item, except: [:index, :new, :create]
def update
  if @item.update(item_params)
    redirect_to root_path
  else 
    render:edit
  end
end


private
def item_params
  params.require(:item).permit(:name, :explanation, :price, :condition_id, :payer_id, :preparation_day_id, :prefecture_id, images_attributes: [:url, :_destroy, :id])
end


def set_item
  @item =Item.find(params[:id])
end

def edit
end
  
def destroy
end


def show
end


end


<<<<<<< HEAD
private

def item_params
  params.require(:item).permit(:name, :text, :category_id, :condition_id, :deliverycost_id, :pref_id, :delivery_days_id, :price, images: []).merge(user_id: current_user.id, boughtflg_id:"1")
  end
end
=======
# includes(:images).order('created_at DESC')
>>>>>>> master
