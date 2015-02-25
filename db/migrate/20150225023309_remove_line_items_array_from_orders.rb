class RemoveLineItemsArrayFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :line_items_array, :text
  end
end
