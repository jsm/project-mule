Given /the following items exist/ do |items_table|
    menu = Menu.create!(:date => Date.today + 1)
    items_table.hashes.each do |item|
        vendor = item.delete("vendor")
        qty = item.delete("quantity")
        i = Item.create!(item)
        i.vendor = Vendor.find_by_name(vendor)
        i.save!
        mi = i.create_menu_item({:quantity => qty})
        mi.update_attribute(:menu_id, menu.id)
    end
end

Then /I should see all the items/ do
    Item.select("name").each do |t|
        page.should have_content(t.name)
    end
end

Given /I select the following from "(.*?)"/ do |all_ingredients_list, ingredients_table|
    ingredients_table.hashes.each do |ingredient|
        select(ingredient['name'], :from => all_ingredients_list)
    end
end
