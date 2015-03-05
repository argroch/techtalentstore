Rails.configuration.stripe = {

  :publishable_key => "#{ENV['stripe_pk_test']}",

  :secret_key => "#{ENV['stripe_sk_test']}"

}



Stripe.api_key = Rails.configuration.stripe[:secret_key]