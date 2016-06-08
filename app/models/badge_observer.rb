class BadgeObserver < ActiveRecord::Observer
  def after_create(badge)
    order = GetOrderService.new.call(badge.scout.troop)
    badge.update(opening_order: order)
  end

  def after_save(badge)
    if badge.closed_at_was.nil? && badge.closed_at
      order = GetOrderService.new.call(badge.scout.troop)
      badge.update_columns(closing_order_id: order.id)
    end
  end
end