class CartController < ApplicationController
	def cart
		@subtotal = 0
		@tax_total = 0
		@total = 0
		@cart_items = {}
        @tax = 9.0
        if session[:cart] && session[:cart][:items]
            session[:cart][:items].each do |id, qty|
                @cart_items[MenuItem.find(id)] = qty
            end
        end
        @cart_items.each do |menu_item,qty|
            @subtotal = @subtotal + menu_item.price * qty
        end
        @tax_total = @tax / 100.0 * @subtotal
        @total = @tax_total + @subtotal
        if @cart_items.present?
            render :partial => 'cart/cart-modal-body'
        else
            render :partial => 'cart/empty-cart'
        end
    end
end
