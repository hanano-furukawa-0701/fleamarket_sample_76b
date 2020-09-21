require 'rails_helper'

describe Credit_Card do
  describe 'createアクションにアクセスしたとき' do
    it "@credit_cardに正しい値が入っていること" do   
      RSpec.describe Credit_Card, type: :model do
        let(:credit_card) { FactoryBot.create(:credit_card) }
      end
    end
  end
end