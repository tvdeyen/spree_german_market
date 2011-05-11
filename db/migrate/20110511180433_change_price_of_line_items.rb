class ChangePriceOfLineItems < ActiveRecord::Migration
  def self.up
    change_column :line_items, :price, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
  end

  def self.down
    change_column :variants, :price, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
  end
end
