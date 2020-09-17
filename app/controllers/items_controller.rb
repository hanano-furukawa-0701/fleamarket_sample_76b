class ItemsController < ApplicationController

  def index   
  end

  def show
  end

  def purchase
  end

  def pay
    # @item = Item.find(params[:id])
    credit_card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: 200,
      customer: credit_card.customer_id,
      currency: 'jpy'
    )
  end

end
