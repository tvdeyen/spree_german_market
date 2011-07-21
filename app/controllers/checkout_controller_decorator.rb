CheckoutController.class_eval do
  
  before_filter :skip_terms_confirmed_validation, :only => [:paypal_confirm]
  
private
  
  def skip_terms_confirmed_validation
    load_order if not defined?(@order)
    @order.skip_terms_confirmed_validation = true
  end
  
end
