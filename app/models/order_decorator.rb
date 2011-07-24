Order.class_eval do
  
  attr_accessible :terms_conditions
  validates_confirmation_of :terms_conditions, :if => proc(){ |order| order.state == 'confirm' } && proc(){ |order| !order.skip_terms_confirmed_validation }
  
  attr_accessor :skip_terms_confirmed_validation
  
end
