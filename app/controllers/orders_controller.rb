class OrdersController < ApplicationController
  include SortableDecorator
  before_action :set_order, only: [:show, :edit, :update, :destroy, :close]


  def index
    @sort_param = "number"
    @sort_model = Order
    @orders = Order.all.order(sort_column + " " + sort_direction)
  end

  def new
    @order = GetOrderService.new.call(current_user.troop)
  end

  def edit
    @opened_badges = @order.opened_badges
    @closed_badges = @order.closed_badges
  end

  def close
    @order.finished_at = Time.now
    @order.open = false
    @order.save
    redirect_to @order, notice: 'Order was successfully given.'
  end

  def update
    if @order.update_attributes(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @order = GetOrderService.new.call(current_user.troop).update_attributes(order_params)
    if @order.save
      redirect_to orders_path, notice: 'Order was successfully opened.'
    else
      render :new
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  def show
    strategy = @order.get_describer(params[:kind])
    strategy.describe_order
    @header = strategy.header
    @middle = strategy.middle
    @badges = strategy.badges
    @signature = strategy.signature
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:quote, :number, :troop_id, :kind)
  end

end