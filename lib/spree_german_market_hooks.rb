class SpreeGermanMarketHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  
  Deface::Override.new(
    :virtual_path => "checkout/_confirm",
    :name => "order_terms_conditions",
    :insert_after => "#order_details",
    :text => "<%= render 'shared/_terms_conditions.html.erb', :locals => {:order => @order} %>"
  )
  
end
