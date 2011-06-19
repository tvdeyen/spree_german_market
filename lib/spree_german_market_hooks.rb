class SpreeGermanMarketHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  
  Deface::Override.new(
    :virtual_path => "checkout/_confirm",
    :insert_after => "#order_details",
    :partial => 'shared/terms_conditions'
  )
  
end
