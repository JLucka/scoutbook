class ScoutsController < InheritedResources::Base
  before_action :set_scout, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @scouts = Scout.all.order(sort_column + " " + sort_direction)
  end

  def show
    @open_badges = @scout.badges.where(closed_at: nil).order(:opened_at)
    @badges = @scout.badges.where.not(closed_at: nil).order(:stars)
  end

  def new
    @scout = Scout.new
  end

  def edit
  end

  def update
    if @scout.update_attributes(scout_params)
        redirect_to @scout, notice: 'Scout was successfully updated.'
    else
       render :edit
    end
  end

  def create
    @scout = Scout.create(scout_params)
    if @scout.save
      redirect_to scouts_path, notice: 'Scout was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @scout.destroy
    redirect_to scouts_url, notice: 'Scout was successfully destroyed.'
  end

  private

  def sort_column
    Scout.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def set_scout
    @scout = Scout.find(params[:id])
  end

  def scout_params
      params.require(:scout).permit(:first_name, :last_name, :pesel, :address, :mothers_name, :fathers_name,
      :rank, :position, :patrol_id)
  end
end

