require 'test_helper'

class ItemTest < ActiveSupport::TestCase


  belongs_to_active_hash :condition,:payer
  belongs_to :user,optional: true
  validates :condition,presence: true
>>>>>>> master
end
