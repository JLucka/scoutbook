class BadgesController < InheritedResources::Base
  before_action :set_badge, only: [:edit, :update, :destroy, :close]
  helper_method :sort_column, :sort_direction

  def index
    @badges = Badge.all.order(sort_column + " " + sort_direction)
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def close
    @badge.closed_at = Time.now
    @badge.save
    redirect_to @badge, notice: 'Badge was successfully given.'
  end

  def update
    if @badge.update_attributes(badge_params)
      redirect_to @badge, notice: 'Badge was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @badge = Badge.create(badge_params)
    if @badge.save
      redirect_to badges_path, notice: 'Badge was successfully opened.'
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to badges_url, notice: 'Badge was successfully destroyed.'
  end


  private

    def sort_column
      Badge.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:name, :stars, :scout_id, :opened_at, :closed_at)
    end
end

