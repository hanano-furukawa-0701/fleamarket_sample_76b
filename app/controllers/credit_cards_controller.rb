class CreditCardsController < ApplicationController
  
  require 'payjp'

  def index
  end

  def new
    credit_card = Credit_card.where(user_id: current_user.id).first
    redirect_to action: "index" if credit_card.present?
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @credit_card = Credit_card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit_card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

end
