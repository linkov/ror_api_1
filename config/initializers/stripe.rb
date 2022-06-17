Rails.configuration.stripe = {
    :publishable_key => 'pk_test_k1tj75jfjpGDE8FjbYlGLa38',
    :secret_key      => 'sk_test_Q7JWhgRb6BoPwJ36pF1CeFcl'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
