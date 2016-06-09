class PatrolsController < InheritedResources::Base
  before_action :set_patrol, only: [:show, :edit, :update, :destroy]

  def index
    @patrols = Patrol.all
  end

  def show
    @scouts = @patrol.scouts
  end

  def new
    @patrol = Patrol.new
  end

  def edit
  end

  def update
    if @patrol.update_attributes(patrol_params)
      redirect_to @patrol, notice: 'Patrol was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @patrol = Patrol.create(patrol_params)
    if @patrol.save
      redirect_to patrols_path, notice: 'Patrol was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @patrol.destroy
    redirect_to patrols_url, notice: 'Patrol was successfully destroyed.'
  end

  private

    def set_patrol
      @patrol = Patrol.find(params[:id])
    end

    def patrol_params
      params.require(:patrol).permit(:name, :troop_id)
    end
end