# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      root_path

    when /^the all_items page$/
	    items_path

	when /^the create_new_item page$/
	  new_item_path

    when /^the Show Menu page$/
      menu_path(Menu.first)

    when /^the users page$/
      users_path

    when /^the users page for "(.*)"$/
      user_path(User.find_by_email($1))

    when /^the login page$/
      user_session_path

    when /^the create account page$/
      new_user_registration_path

    when /^the item page for "(.*)"/
      item_path(Item.find_by_name($1).id)

    when /^the all_ingredients page$/
      ingredients_path

    when /^the create_new_ingredient page$/
      new_ingredient_path

    when /^the new vendor page$/
      new_vendor_path

    when /^the show vendors page$/
      vendors_path

    when /^the vendor page for "(.*)"/
      vendor_path(Vendor.find_by_name($1).id)
 
#number Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)