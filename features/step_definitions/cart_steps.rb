Given /I have added the following items to my cart/ do | table |
	cart = {:items => {}}
	table.hashes.each do |item|
		cart[:items][Item.where(:name => item[:name]).last.menu_items.order("created_at").last.id] = item[:qty].to_i
	end
	page.set_rack_session(:cart => cart, :customer_pickup_point => DeliveryPoint.all.last)
end

Given /I increase the quantity of "(.*)"/ do | item |
	id = Item.where(:name => item).last.menu_items.order("created_at").last.id
	button_id = "#{id}-item-plus"
	click_button(button_id)
end

Given /I decrease the quantity of "(.*)"/ do | item |
	id = Item.where(:name => item).last.menu_items.order("created_at").last.id
	button_id = "#{id}-item-minus"
	click_button(button_id)
end

Given /I remove "(.*)"/ do |item|
	id = Item.where(:name=> item).last.menu_items.order("created_at").last.id
	button_id = "#{id}-item-remove"
	click_button(button_id)
end