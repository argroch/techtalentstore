class CartController < ApplicationController
  
	before_filter :authenticate_user!, :except => [:add_to_cart, :view_order, :change_quantity, :remove_from_cart]

  def add_to_cart
    product = Product.find(params[:product_id])
    if product.quantity < params[:quantity].to_i
      redirect_to product, notice: 'Not enough quantity in stock to complete order!'
    else
    	line_item = LineItem.new
    	line_item.product_id = params[:product_id]
    	line_item.quantity = params[:quantity]
    	line_item.save

    	line_item.line_item_total = line_item.product.price * line_item.quantity
    	line_item.save

    	redirect_to root_path
    end
  end

  def change_quantity
    line_item = LineItem.find(params[:line_item_id])
    line_item.quantity = params[:quantity]
    line_item.save

    redirect_to view_order_path
  end

  def remove_from_cart
    line_item = LineItem.find(params[:line_item_id])
    line_item.destroy
    line_item.save

    redirect_to view_order_path
  end

  def view_order
  	@line_items = LineItem.all
  end

  def checkout
  	@line_items = LineItem.all
  	@order = Order.new
  	@order.user_id = current_user.id

  	sum = 0

  	@line_items.each do |line_item|
  		@order.order_items[line_item.product_id] = line_item.quantity
  	end

  	@line_items.each do |line_item|
  		sum += line_item.line_item_total
  	end

  	@order.subtotal = sum
  	@order.sales_tax = sum * 0.07
  	@order.grand_total = sum + @order.sales_tax
  	@order.save

  	@line_items.each do |line_item|
  		line_item.product.quantity -= line_item.quantity
  		line_item.product.save
  	end
  end

  def order_complete
    @order = Order.find(params[:order_id])
    @amount = (@order.grand_total.to_f.round(2) * 100).to_i
    LineItem.destroy_all

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Rails Stripe customer',
      :currency => 'usd'
    )

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
