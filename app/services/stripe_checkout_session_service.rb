class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    return unless order

    # Prevent running twice
    return unless order.state == 'pending'

    order.update!(state: 'paid')

    product = order.product

    return unless product

    if product.stock_quantity > 0
      product.update(
        stock_quantity: product.stock_quantity - 1
      )
    end
    # order.update(state: 'paid')
  end
end