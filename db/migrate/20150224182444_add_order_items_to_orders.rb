class AddOrderItemsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :order_items, :text
  end
end
