class GetOrderService
  def call(troop)
    troop_orders = Order.where(troop_id: troop)
    if troop_orders.where(open: true).count == 1
      troop_orders.first
    else
      number = troop_orders.count + 1
      Order.create(troop: troop, number: number)
    end
  end
end