PayPal::SDK::REST.set_config(
  :mode => "sandbox",  # Change to "live" when going to production
  :client_id => ENV["PAYPAL_CLIENT_ID"],
  :client_secret => ENV["PAYPAL_SECRET"]
)
