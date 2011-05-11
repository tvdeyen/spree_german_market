class ChangePriceOfVariants < ActiveRecord::Migration
  def self.up
    change_column :variants, :cost_price, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
    change_column :variants, :price, :decimal, :null => true, :default => nil, :precision => 8, :scale => 3
  end

  def self.down
    change_column :variants, :cost_price, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
    change_column :variants, :price, :decimal, :null => true, :default => nil, :precision => 8, :scale => 2
  end
end
