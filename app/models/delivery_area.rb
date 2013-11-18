class DeliveryArea < ActiveRecord::Base
    validates_presence_of :name
    attr_accessible :name #:user

    belongs_to :user, :class_name => "User"
    belongs_to :menu
    has_many :delivery_points

end
