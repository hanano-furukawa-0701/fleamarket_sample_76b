require 'rails_helper'

describe CreditCardsController do
  let(:credit_card) { create(:credit_card, user_id: user.id) }
  let(:user) { create(:user) }
  
  describe 'createアクションにアクセスしたとき' do
    before do
      payjp_customer = double("Payjp::Customer")
      allow(Payjp::Customer).to receive(:create).and_return(payjp_customer)
      allow(payjp_customer).to receive(:id).and_return("cus_xxxxxxxxxxxxxxxxxxxxxxxxxxxx")
    end
    it "@credit_cardに正しい値が入っていること" do
      post :create, params: { id: credit_card }
      expect(assigns(:credit_card)).to eq credit_card
    end
  end
  
end