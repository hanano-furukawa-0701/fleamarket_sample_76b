class CreditCardsController < ApplicationController
  before_action :access_restrictions
  before_action :set_card, except: [:create]

  def index
    if @credit_card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)
      @default_card_infomation = customer.cards.retrieve(@credit_card.card_id)
    end
  end

  def new
    redirect_to action: "index" if @credit_card.present?
  end

  def create
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @credit_card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit_card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  def destroy
    if @credit_card.present?
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)
      customer.delete
      @credit_card.delete
      redirect_to action: "new"
      flash[:notice] = 'クレジットカードを削除しました'
    end
  end

  private

  def access_restrictions
    unless user_signed_in?
      flash[:alert] = 'ログインが必要です' 
      redirect_to new_user_session_path 
    end
  end

  def set_card
    @credit_card = CreditCard.where(user_id: current_user.id).first 
  end

end
