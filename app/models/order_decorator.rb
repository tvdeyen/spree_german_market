Order.class_eval do

  attr_accessible :terms_conditions
  validate :terms_confirmed?, :if => Proc.new{ |order| :confirm === order.state_name.to_sym }

  Order.state_machines[:state] = StateMachine::Machine.new(Order, :initial => 'cart') do

    event :next do
      transition :from => 'cart',     :to => 'address'
      transition :from => 'address',  :to => 'delivery'
      transition :from => 'delivery', :to => 'payment'
      transition :from => 'payment',  :to => 'confirm'
      transition :from => 'confirm',  :to => 'complete'
    end

    event :cancel do
      transition :to => 'canceled', :if => :allow_cancel?
    end
    event :return do
      transition :to => 'returned', :from => 'awaiting_return'
    end
    event :resume do
      transition :to => 'resumed', :from => 'canceled', :if => :allow_resume?
    end
    event :authorize_return do
      transition :to => 'awaiting_return'
    end

    before_transition :to => 'complete' do |order|
      begin
        order.process_payments!
      rescue Spree::GatewayError
        if Spree::Config[:allow_checkout_on_gateway_error]
          true
        else
          false
        end
      end
    end

    after_transition :to => 'complete', :do => :finalize!
    after_transition :to => 'delivery', :do => :create_tax_charge!
    after_transition :to => 'payment', :do => :create_shipment!
    after_transition :to => 'canceled', :do => :after_cancel

  end

  def terms_confirmed?
    if !state_changed? && !terms_conditions?
      errors.add(:terms_conditions, :must_be_confirmed)
      return false
    end
    return true
  end

end