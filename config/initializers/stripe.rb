Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_B3pbiwgJ3YYbv9zxS8ihlGpG'],
  :secret_key      => ENV['sk_test_0oXYsBsxJTYvcLhrBA6mrwU6']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]