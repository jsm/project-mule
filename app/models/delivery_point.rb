class DeliveryPoint < ActiveRecord::Base
 
  validates_presence_of :address, :latitude, :longitude
  attr_accessible :address, :latitude, :longitude, :delivery_area
  belongs_to :customer, :class_name => "User"
  belongs_to :delivery_area



end


