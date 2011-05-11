class AddTermsConfirmationToOrder < ActiveRecord::Migration
  def self.up
    change_table :orders do |t|
      t.boolean :terms_conditions, :null => true
    end
  end

  def self.down
    change_table :orders do |t|
      t.remove :terms_conditions
    end
  end
end
