class ChangeFieldsOfOrders < ActiveRecord::Migration
  def self.up
    change_column :orders, :item_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
    change_column :orders, :total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
    change_column :orders, :adjustment_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
    change_column :orders, :credit_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
    change_column :orders, :payment_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
  end

  def self.down
    change_column :orders, :item_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
    change_column :orders, :total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
    change_column :orders, :adjustment_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
    change_column :orders, :credit_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
    change_column :orders, :payment_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
  end
end
