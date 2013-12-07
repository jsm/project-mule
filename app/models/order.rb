class Order < ActiveRecord::Base
    belongs_to :user
    has_many :order_items
    attr_accessible :transaction_id
end
