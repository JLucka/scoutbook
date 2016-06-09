class TroopsController < InheritedResources::Base
  before_action :set_troop, only: [:show, :edit, :update, :destroy]

  def index
    @troops = Troop.all
  end

  def show
    @patrols = @troop.patrols
    @leaders = @troop.leaders
  end

  def new
    @troop = Troop.new
  end

  def edit
  end

  def update
    if @troop.update_attributes(troop_params)
      redirect_to @troop, notice: 'Troop was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @troop = Troop.create(troop_params)
    if @troop.save
      redirect_to troops_path, notice: 'Troop was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @troop.destroy
    redirect_to troops_url, notice: 'Troop was successfully destroyed.'
  end


  private
  def set_troop
    @troop = Troop.find(params[:id])
  end

  def troop_params
      params.require(:troop).permit(:name, :full_name, :number, :patron, :district, :region)
  end
end