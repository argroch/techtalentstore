class AddValueToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :line_items, :text
  end
end
