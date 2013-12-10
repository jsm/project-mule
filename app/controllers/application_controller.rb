class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :initialize_cart, :set_chosen_pickup_point

    rescue_from CanCan::AccessDenied do|exception|
      flash[:error] = "Access denied."
      redirect_to root_url
    end


    protected

    def initialize_cart
        session[:cart] ||= HashWithIndifferentAccess.new()
        session[:cart][:items] ||= HashWithIndifferentAccess.new()
    end

    def set_chosen_pickup_point
        @chosen_point = session[:customer_pickup_point]
    end

    # Before filter for if user is logged in
    def user_logged_in
        redirect_to(root_path) unless user_signed_in?
    end

    def verify_if_admin
        if current_user.nil?
            redirect_to(root_path) and return
        else
            redirect_to(root_path) and return unless current_user.admin?
        end
    end
end
