class LeadersController < InheritedResources::Base

  def index
    @leaders = Leader.all
  end

  def new
    @leader = Leader.new
  end

  def create
    scout_id = leader_params[:scout_id]
    user_id = leader_params[:user_id]
    @leader = LeaderBuilder.new(Leader).build_leader(leader_params, scout_id, user_id)
    if @leader.save
      redirect_to leaders_path, notice: 'Leader was successfully appointed.'
    else
      render :new
    end
  end

  private

    def leader_params
      params.require(:leader).permit(:leader_rank, :phone, :troop_id, :scout_id, :position, :user_id)
    end
end

