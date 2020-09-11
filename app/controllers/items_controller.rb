class ItemsController < ApplicationController

  def index   
  end

  def show
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
