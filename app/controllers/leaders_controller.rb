class LeadersController < InheritedResources::Base

  def index
    @leaders = Leader.all
  end

  def new
    @leader = Leader.new
  end

  def create
    @leader = Leader.create(leader_params)
    if @leader.save
      @leader.scout = Scout.find(leader_params[:scout_id])
      @leader.scout.update(position: leader_params[:position])
      @leader.scout.save
      redirect_to leaders_path, notice: 'Leader was successfully appointed.'
    else
      render :new
    end
  end

  private

    def leader_params
      params.require(:leader).permit(:leader_rank, :phone, :troop_id, :scout_id, :position)
    end
end

