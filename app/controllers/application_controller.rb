class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Mobvious::Rails::Controller

  before_filter :brands

  def brands
  	products = Product.all
  	@brands = []

  	products.each do |product|
  		unless @brands.include?(product.brand)
  			@brands.push(product.brand)
  		end
  	end

  	return @brands
  end

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
      "#{ENV['my_url']}"
    else
      request.remote_ip
    end
  end


  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :name, :address, :city, :state, :zip, :admin) }

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, 
      :current_password, :name, :address, :city, :state, :zip, :admin) }

  end
end
