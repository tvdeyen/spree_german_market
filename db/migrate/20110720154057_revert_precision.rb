class RevertPrecision < ActiveRecord::Migration
  def self.up
    change_column :orders, :item_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
    change_column :orders, :total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
    change_column :orders, :adjustment_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
    change_column :orders, :credit_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
    change_column :orders, :payment_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
    
    change_column :variants, :price, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2

    change_column :variants, :cost_price, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
    change_column :variants, :price, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
  end

  def self.down
    change_column :orders, :item_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
    change_column :orders, :total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
    change_column :orders, :adjustment_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
    change_column :orders, :credit_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
    change_column :orders, :payment_total, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
    
    change_column :line_items, :price, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3

    change_column :variants, :cost_price, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
    change_column :variants, :price, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
  end
end
