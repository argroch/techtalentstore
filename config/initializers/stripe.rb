Rails.configuration.stripe = {

  :publishable_key => "pk_test_jJJ9GnD1kcowriz2uV1XxTzi",

  :secret_key => "sk_test_18HJRmCCamUtxJXVJdu8Drrn"

}



Stripe.api_key = Rails.configuration.stripe[:secret_key]