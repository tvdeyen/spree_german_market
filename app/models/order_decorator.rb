Order.class_eval do
  
  attr_accessible :terms_conditions
  validate :terms_confirmed?, :if => Proc.new{ |order| order.state == 'confirm' } && Proc.new{ |order| !order.skip_terms_confirmed_validation }
  
  attr_accessor :skip_terms_confirmed_validation
  
  def terms_confirmed?
    if !state_changed? && !terms_conditions?
      errors.add(:terms_conditions, :must_be_confirmed)
      return false
    end
    return true
  end
  
end
