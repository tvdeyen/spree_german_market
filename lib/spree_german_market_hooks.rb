class SpreeGermanMarketHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  
  Deface::Override.new(
    :virtual_path => "checkout/_confirm",
    :insert_bottom => "#order_details",
    :partial => 'shared/terms_conditions'
  )
  
  Deface::Override.new(
    :virtual_path => "shared/paypal_express_confirm",
    :insert_bottom => "#order_details",
    :partial => 'shared/terms_conditions'
  )
  
end
